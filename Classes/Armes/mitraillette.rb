class Mitraillette < Arme

  def initialize(image, vitesseTir, cadenceTir, degat)
    image = Gosu::Image.new("res/hero/face.png")
    super(image, 100, 100, 100)
  end

end