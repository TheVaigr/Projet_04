class Bomber < Ennemi

  def initialize(x, y)
    image = Gosu::Image.new("res/hero/face.png")
    super(image, 100, 100, 100, 100, 100, 100, x, y)
  end

end