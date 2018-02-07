require_relative 'arme'

class Canon < Arme

  def initialize
    @type = "canon"
    super(Gosu::Image.new("../Ressources/missil_2.png"), 100, 100, 100)
  end

end