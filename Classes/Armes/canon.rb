require_relative 'arme'

class Canon < Arme

  def initialize
    @type = "canon"
    super(Gosu::Image.new("../Ressources/missil_2.png"), 10, 16, 100)
  end

end