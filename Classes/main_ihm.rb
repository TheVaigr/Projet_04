class MainIHM < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @background_image = Gosu::Image.new("res/picture.jpg")
    @hero = Hero.new(width/2, height/2)
    @song = Gosu::Song.new("res/music.mp3")
    @song.volume = 0.0
    @song.play(true)
  end

  def update
    @hero.go_left if Gosu::button_down?(Gosu::KbLeft)
    @hero.go_right if Gosu::button_down?(Gosu::KbRight)
    if (!Gosu::button_down?(Gosu::KbRight)) && (!Gosu::button_down?(Gosu::KbLeft))
      @hero.go_front
    end
    @hero.move
    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @hero.draw
  end

end
