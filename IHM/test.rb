require_relative '../Model/model'
require_relative '../Classes/hero'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/z_order'
require_relative '../Classes/Ennemis/bomber'
require_relative '../Classes/Ennemis/gardien'
require_relative '../Classes/Ennemis/ennemi'

class Test < Gosu::Window

  def initialize(width, height, model)

    super width, height
    self.caption = "Milky Way Light"
    @background_image = Gosu::Image.new("../Ressources/ecrant_acceuil.png")
    @model = model
    @vitesseAutoScroll = model.niveauDifficulte * 4
    @ennemis = []
    @ennemis[0] = Gardien.new(900,50)
    @ennemis[1] = Bomber.new(800 , 50)

    @song = Gosu::Song.new("../Ressources/music/InGame.mp3")
    @song.volume = 0.0
    @song.play(true)

    #-------------------------------------------------------

    @font1 = Gosu::Font.new(35)
    @font2 = Gosu::Font.new(25)
    @nom = "Marc"
    @lvl = 0
    @score = 0
    @progression = 0
    @arme = "mitrailleuse"
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @contours_R = Gosu::Image.new("../ressources/side_Rpng")
    @contours_L = Gosu::Image.new("../ressources/side_L.png")

    #-------------------------------------------------------

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
        @ennemis[i].seDeplacer(@vitesseAutoScroll,@model.niveauDifficulte, @model.hero)

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
  @score += 1
    @progression += 1
    @progression = @progression%1000
    @lvl += 1
  end

  def needs_cursor?
    true
  end



  def draw
    #@background_image.draw(660, 0, ZOrder::Background)
    @model.hero.draw


    #-------------------------------------------------------

    @ligne = Gosu::draw_line(480, 0, Gosu::Color.new(0xff_ffffff), 480, 1080, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(1440, 0, Gosu::Color.new(0xff_ffffff), 1440, 1080, Gosu::Color.new(0xff_ffffff))
    @contours_L.draw(480,0,1)
    @contours_R.draw(1440,0,1)

    @font1.draw(@nom, 240-@font1.text_width(@nom)/2, 100, 2)
    @font1.draw("LVL : ", 240-@font1.text_width("LVL : ")/2, 200, 2)
    @font1.draw(@lvl/1000, 240+@font1.text_width("LVL : ")/2, 200, 2)
    @font1.draw("Progression : ", 240-@font1.text_width("Progression :  ")/2, 300, 2)
    @font1.draw(@progression/10, 240+@font1.text_width("Progression :  ")/2, 300, 2)
    @font1.draw("%", 260+@font1.text_width("Progression : 100")/2, 300, 2)
    @font1.draw("Score : ", 240-@font1.text_width("Score : ")/2, 400, 2)
    @font1.draw(@score, 240+@font1.text_width("Score : ")/2, 400, 2)
    @font1.draw("armes", 240-@font1.text_width("armes")/2, 500, 2)
    @font1.draw("bonus", 240-@font1.text_width("bonus")/2, 600, 2)



    #-------------------------------------------------------






    for i in 0..(@ennemis.size-1)
      @ennemis[i].draw
    end

  end

end
