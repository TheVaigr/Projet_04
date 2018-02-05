require_relative 'arme'

class Canon < Arme

  def initialize()
    @image = Gosu::Image.new("../../resources/missil_2.png")
    super (@image,100,100,100)

  end

end