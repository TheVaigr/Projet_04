require_relative '../*'

class MainIHM < Gosu::Window

  def initialize(width, height, niveauDifficulte, pseudo)
    super
    self.caption = "Milky Way Light"
    @model = new Model(width, height, niveauDifficulte, pseudo)
    @background_image = Gosu::Image.new("res/picture.jpg")
    @song = Gosu::Song.new("res/music.mp3")
    @song.volume = 0.0
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


    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def draw('jj')
    @background_image.draw(0, 0, ZOrder::Background)
    @hero.draw
    for ennemis
      @ennemi.draw
    end
  end

end
