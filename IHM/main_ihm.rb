require_relative '../Model/model'
require_relative '../Classes/hero'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/z_order'


class MainIHM < Gosu::Window

  def initialize(width, height, model)

    super width, height
    self.caption = "Milky Way Light"
    @background_image = Gosu::Image.new("../Ressources/ecrant_acceuil.png")
    @model = model
    @vitesseAutoScroll = model.niveauDifficulte * 4
    @ennemis = []
    @ennemis[0] = Gardien.new(@model.hero,900,50)
    @ennem = Bomber.new(@model.hero, 800 , 50)

    @song = Gosu::Song.new("../Ressources/music/InGame.mp3")
    @song.volume = 0.5
    @song.play(true)
  end


  def update
    # maj du héro
    if (!Gosu::button_down?(Gosu::KbRight)) && (!Gosu::button_down?(Gosu::KbLeft))
      @model.hero.go_front
    elsif Gosu::button_down?(Gosu::KbRight)
      @model.hero.go_right
    elsif Gosu::button_down?(Gosu::KbLeft)
      @model.hero.go_left
    end
    @model.hero.move

    # maj des hitbox
    @model.hero.majHitbox
    for i in 0..@ennemis.size-1
      @ennemis[i].majHitbox
    end

    # Parcours les ennemis présent sur l'ihm
    for i in 0..@ennemis.size-1
      if @ennemis[i] != NIL
        @ennemis[i].seDeplacer(@vitesseAutoScroll,@model.niveauDifficulte)

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
    close if (Gosu::button_down?(Gosu::KbEscape) || @model.hero.estMort)

  end



  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @model.hero.draw

    for i in 0..(@ennemis.size-1)
      @ennemis[i].draw
    end

  end

end
