require_relative '../Model/model'
require_relative '../Classes/hero'
require_relative '../Classes/projectile'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/z_order'
require_relative '../Classes/Ennemis/bomber'
require_relative '../Classes/Ennemis/gardien'
require_relative '../Classes/Ennemis/ennemi'
require_relative '../Classes/Ennemis/artilleur'
require_relative '../Classes/Bonus/bonus'
require_relative '../Classes/Bonus/heal'

class MainIHM < Gosu::Window

  attr_accessor :background_image, :model, :vitesseAutoScroll, :ennemis, :projectilesAllies, :projectilesEnnemis, :song, :difficulte, :width, :height, :frame, :bonus

  def initialize(width, height, difficulte, model)
    @DEBUT_JEU = 100
    @FIN_JEU = 10000

    super width, height
    self.caption = "Milky Way Light"

    @model = model
    @difficulte = difficulte
    @vitesseAutoScroll = @difficulte * 4
    @ennemis = []
    @projectilesAllies = []
    @projectilesEnnemis = []
    @width = width
    @height = height

    @song = Gosu::Song.new("../Ressources/music/InGame.mp3")
    @song.volume = 0.0
    @song.play(true)

    @frame = 0
    @r = Random.new

    @font1 = Gosu::Font.new(35)
    @font2 = Gosu::Font.new(25)
    @score = 0
    @progression = 0
    @background1 = 0
    @background_image = Gosu::Image.new("../Ressources/background.png")
    @background2 = -1080
    #@arme = "mitrailleuse"
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")

    @bonus = []




  end

##################################################################################################
  def update
    @frame = @frame + 1
    if @progression < 100
      @progression = (@frame*100)/@FIN_JEU
    end

    @background1 += 3
    @background2 += 3
    if @background1 == 1080
      @background1 = 0
    end
    if @background2 == 0
      @background2 = -1080
    end

    # Déplacement du héro
    if (!Gosu::button_down?(Gosu::KbRight)) && (!Gosu::button_down?(Gosu::KbLeft))
      @model.hero.go_front
    elsif Gosu::button_down?(Gosu::KbRight) && @model.hero.x < @width*0.75 - @model.hero.image.width
      @model.hero.go_right
    elsif Gosu::button_down?(Gosu::KbLeft) && @model.hero.x > @width*0.25
      @model.hero.go_left
    end
    @model.hero.move

    # Deplacement des ennemis, collisions avec hero, mort de l'ennemi si hors map
    for i in 0..@ennemis.size-1
      if @ennemis[i] != nil
        @ennemis[i].seDeplacer(@difficulte)
        # Test collision entre ennemis et héro
        if @model.collision(@model.hero.hitbox,@ennemis[i].hitbox)
          @model.hero.vie -= @ennemis[i].degatCollision
          @ennemis.delete(@ennemis[i])
        elsif @ennemis[i].estDehors
          @ennemis.delete(@ennemis[i])
        end
      end
    end

    # Deplacement des bonus
    for i in 0..@bonus.size-1
      @bonus[i].seDeplace
    end

    # maj des hitbox (hero, ennemis, projectiles + déplacement)
    @model.hero.majHitbox
    for i in 0..@ennemis.size-1
      @ennemis[i].majHitbox
    end
    for i in 0..@projectilesAllies.size-1
      if @projectilesAllies[i] != nil
        @projectilesAllies[i].seDeplacer
        @projectilesAllies[i].majHitbox
      end
    end
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        @projectilesEnnemis[i].seDeplacer
        @projectilesEnnemis[i].majHitbox
      end
    end
    for i in 0..@bonus.size-1
      @bonus[i].majHitbox
    end

    # Test de collision entre ennemis et projectiles alliés
    for j in 0..@ennemis.size-1
      for i in 0..@projectilesAllies.size-1
        if @ennemis[j] != nil && @projectilesAllies[i] != nil
          if @model.collision(@projectilesAllies[i].hitbox, @ennemis[j].hitbox)
            @ennemis[j].vie = @ennemis[j].vie - @projectilesAllies[i].degat
            @projectilesAllies.delete(@projectilesAllies[i])
            if @ennemis[j].estMort
              @model.hero.score = @model.hero.score + 5
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

    # Test de collision entre hero et bonus
    for i in 0..@bonus.size-1
      if @bonus[i] != nil
        if @model.collision(@bonus[i].hitbox, @model.hero.hitbox)
          @model.hero.vie = @model.hero.vie + @bonus[i].soin
          @bonus.delete(@bonus[i])
          if @model.hero.vie >= @model.hero.vieMax
            @model.hero.vie = @model.hero.vieMax
          end
        end
      end
    end

    # Tir du héro
    if ((@frame % @model.hero.arme.cadenceTir) == 0)
      projectiles = @model.hero.tire
      for i in 0..projectiles.size
        @projectilesAllies.push(projectiles[i])
      end

    end

    # Tir des ennemis
    for i in 0..@ennemis.size-1
      if @ennemis[i].arme != nil
        if (@frame.to_f % @model.getCadenceTirArtilleur.to_f) == 0.0
          projectiles = @ennemis[i].tire(@model.hero.x)
          for i in 0..projectiles.size
            @projectilesEnnemis.push(projectiles[i])
          end
        end
      end
    end

    # Génération des ennemis aléatoire
    postGame = 0
    if @frame > @DEBUT_JEU && (@frame % (30/@difficulte.to_f+15) == 0.0) && @frame < @FIN_JEU
      r = @r.rand(0...3)
      if r == 0
        @ennemis.push(Artilleur.new(@r.rand(@width*0.25...@width*0.75-100),0))
      elsif r == 1
        @ennemis.push(Bomber.new(@r.rand(@width*0.25...@width*0.75-100),0))
      elsif r == 2
        for i in 0..@r.rand(0...3)
          @ennemis.push(Gardien.new(@r.rand(@width*0.25...@width*0.75-100),0))
        end
      end
    end

    # Génération des bonus
    if @r.rand(0...1500) == 1
      @bonus.push(Heal.new(@r.rand(@width*0.25...@width*0.75-100),0))
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
    background_image.draw(480,@background1,-1)
    background_image.draw(480,@background2,-1)
    for i in 0..@bonus.size-1
      if @bonus[i] != nil
        @bonus[i].draw
      end
    end
    for i in 0..@projectilesAllies.size-1
      if @projectilesAllies[i] != nil
      @projectilesAllies[i].draw
      end
    end
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        @projectilesEnnemis[i].draw
      end
    end
    if !@model.hero.estMort
      @model.hero.draw
    end
    for i in 0..(@ennemis.size-1)
      @ennemis[i].draw
    end

    @ligne = Gosu::draw_line(480, 0, Gosu::Color.new(0xff_ffffff), 480, 1080, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(1440, 0, Gosu::Color.new(0xff_ffffff), 1440, 1080, Gosu::Color.new(0xff_ffffff))



    @font1.draw(@model.hero.pseudo, 240-@font1.text_width(@model.hero.pseudo)/2, 100, 2)
    @font1.draw("Niveau :", 100, 200, 2)
    @font1.draw(@difficulte/1000, 300, 200, 2)
    @font1.draw("Avancée :", 100, 300, 2)
    @font1.draw(@progression, 300, 300, 2)
    @font1.draw("%", 355, 300, 2)
    @font1.draw("Score :", 100, 400, 2)
    @font1.draw(@model.hero.score, 300, 400, 2)
    @font1.draw("Armes", 100, 500, 2)
  end

  def button_up(id)
    if id == Gosu::KbDown
      @model.hero.changeArme
    end
  end

end
