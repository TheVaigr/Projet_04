require_relative 'ennemi'

class Gardien < Ennemi

  def initialize(image = Gosu::Image.new("../resources/enemie_2_fighter_N.png"),
                 degatCollision = 100,
                 degatTir = 100,
                 ptsVie = 100,
                 vitesseDeplacement = 100,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 x,
                 y)
    super
  end

end