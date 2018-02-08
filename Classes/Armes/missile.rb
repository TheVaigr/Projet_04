require_relative 'arme'

class Missile < Arme

  def initialize
    @type = "missile"
    super(Gosu::Image.new("../Ressources/missil_4.png"), 4, 50, 10000)
  end

end