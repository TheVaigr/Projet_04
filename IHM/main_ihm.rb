require_relative '../Model/model'
require_relative '../Classes/hero'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/z_order'

class MainIHM < Gosu::Window

  def initialize(width, height, pseudo, couleur)
    super width, height
    self.caption = "Milky Way Light"
    @background_image = Gosu::Image.new("../resources/ecrant_acceuil.png")
    @model = Model.new(1, pseudo, couleur, width, height)

    #@song = Gosu::Song.new("res/music.mp3")
    #@song.volume = 0.0
    #@song.play(true)
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


    for i in 0..@model.ennemis.size-1
      if @model.ennemis[i].estMort == true
        @model.ennemis.delete(@model.ennemis[i])
      end
      @model.ennemis[i].seDeplacer(@model.vitesseAutoScroll,@model.niveauDifficulte)
    end

    close if Gosu::button_down?(Gosu::KbEscape)

  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @model.hero.draw

    for i in 0..(@model.ennemis.size-1)
      @model.ennemis[i].draw
    end

  end

end
