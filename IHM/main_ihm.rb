require_relative '../Model/model'
require_relative '../Classes/hero'
require_relative '../Classes/projectile'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/z_order'
require_relative '../Classes/Ennemis/bomber'
require_relative '../Classes/Ennemis/gardien'
require_relative '../Classes/Ennemis/ennemi'
require_relative '../Classes/Ennemis/artilleur'

class MainIHM < Gosu::Window

  attr_accessor :background_image, :model, :vitesseAutoScroll, :ennemis, :projectilesAllies, :projectilesEnnemis, :song, :difficulte, :width, :height, :frame

  def initialize(width, height, difficulte, model)

    super width, height
    self.caption = "Milky Way Light"
    @background_image = Gosu::Image.new("../Ressources/ecrant_acceuil.png")
    @model = model
    @difficulte = difficulte
    @vitesseAutoScroll = @difficulte * 4
    @ennemis = []
    @projectilesAllies = []
    @projectilesEnnemis = []
    @width = width
    @height = height
    @ennemis[0] = Gardien.new(900,50)
    @ennemis[1] = Bomber.new(800 , 50)
    @ennemis[2] = Artilleur.new(800 , 50)

    @song = Gosu::Song.new("../Ressources/music/InGame.mp3")
    @song.volume = 0.0
    @song.play(true)

    @frame = 0
    @r = Random.new
  end

##################################################################################################
  def update
    @frame = @frame + 1

    # déplacement du héro
    if (!Gosu::button_down?(Gosu::KbRight)) && (!Gosu::button_down?(Gosu::KbLeft))
      @model.hero.go_front
    elsif Gosu::button_down?(Gosu::KbRight) && @model.hero.x < @width*0.75
      @model.hero.go_right
    elsif Gosu::button_down?(Gosu::KbLeft) && @model.hero.x > @width*0.25
      @model.hero.go_left
    end
    @model.hero.move

    # Deplacement des ennemis, collisions avec hero, mort de l'ennemi si hors map
    for i in 0..@ennemis.size-1
      if @ennemis[i] != nil
        @ennemis[i].seDeplacer(@vitesseAutoScroll,@difficulte, @model.hero)
        # Test collision entre ennemis et héro
        if @model.collision(@model.hero.hitbox,@ennemis[i].hitbox)
          @model.hero.vie -= @ennemis[i].degatCollision
          @ennemis.delete(@ennemis[i])
          # Test si ennemi est sous l'ihm
        elsif @ennemis[i].estMort
          @ennemis.delete(@ennemis[i])
        end
      end
    end

    # maj des hitbox (hero, ennemis, projectiles + déplacement)
    @model.hero.majHitbox
    for i in 0..@ennemis.size-1
      @ennemis[i].majHitbox
    end
    for i in 0..@projectilesAllies.size-1
      @projectilesAllies[i].seDeplacer
      @projectilesAllies[i].majHitbox
    end
    for i in 0..@projectilesEnnemis.size-1
      @projectilesEnnemis[i].seDeplacer
      @projectilesEnnemis[i].majHitbox
    end

    # Test de collision entre ennemis et projectiles alliés
    for j in 0..@ennemis.size-1
      for i in 0..@projectilesAllies.size-1
        if @ennemis[j] != nil && @projectilesAllies[i] != nil
          if @model.collision(@projectilesAllies[i].hitbox, @ennemis[j].hitbox)
            @ennemis[j].vie = @ennemis[j].vie - @projectilesAllies[i].degat
            @projectilesAllies.delete(@projectilesAllies[i])
            if @ennemis[j].estMort
              @ennemis.delete_at(j)
            end
          end
        end
      end
    end

    # Test de collision entre hero et projectiles ennemis
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        if @model.collision(@projectilesEnnemis[i].hitbox, @model.hero.hitbox)
          @model.hero.vie = @model.hero.vie - @projectilesEnnemis[i].degat
          @projectilesEnnemis.delete(@projectilesEnnemis[i])
        end
      end
    end

    # Tir du héro
    if ((@frame % 20) == 0) #@model.hero.arme.cadenceTir
      @projectilesAllies.push(@model.hero.tire)
    end

    # Tir des ennemis
    for i in 0..@ennemis.size-1
      if @ennemis[i].arme != nil
        if (@frame % 20) == 0
          @projectilesEnnemis.push(@ennemis[i].tire)
        end
      end
    end

    # Génération des ennemis aléatoire
    postGame = 0
    if @frame > postGame && (@frame % 100 == 0)
      r = @r.rand(0...3)
      if r == 0
        @ennemis.push(Artilleur.new(@r.rand(@width*0.25...@width*0.75),0))
      elsif r == 1
        @ennemis.push(Bomber.new(@r.rand(@width*0.25...@width*0.75),0))
      elsif r == 2
        @ennemis.push(Gardien.new(@r.rand(@width*0.25...@width*0.75),0))
      end
    end

    # Suppression des projectiles en dehors de la map
    for i in 0..@projectilesAllies.size-1
      if @projectilesAllies[i] != nil
        if @projectilesAllies[i].y < 0
          @projectilesAllies.delete@projectilesAllies[i]
        end
      end
    end
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        if @projectilesEnnemis[i].y > @height
          @projectilesEnnemis.delete@projectilesEnnemis[i]
        end
      end
    end

    close if Gosu::button_down?(Gosu::KbEscape)

end



  def draw
    #@background_image.draw(0, 0, ZOrder::Background)
    for i in 0..@projectilesAllies.size-1
      @projectilesAllies[i].draw
    end
    for i in 0..@projectilesEnnemis.size-1
      @projectilesEnnemis[i].draw
    end
    if !@model.hero.estMort
      @model.hero.draw
      else
    end
    for i in 0..(@ennemis.size-1)
      @ennemis[i].draw
    end
  end

  def button_up(id)
    if id == Gosu::KbDown
      puts "je passe"
      @model.hero.changeArme
    end
  end

end
