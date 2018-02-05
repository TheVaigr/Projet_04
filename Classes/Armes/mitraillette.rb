class Mitraillette < Arme

  def initialize()
    image = Gosu::Image.new("res/hero/face.png")
    super(image, 100, 100, 100)
  end

end