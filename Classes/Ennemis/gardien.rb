require_relative 'ennemi'

class Gardien < Ennemi

  def initialize(image = Gosu::Image.new("../Ressources/enemie_2_heavyfighter_N.png"),
                 degatCollision = 10000,
                 degatTir = 0,
                 vie = 400,
                 vitesseDeplacement = 2,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 x,
                 y)
    super
    @arme = nil
  end

  def seDeplacer(difficulte)

    @y += @vitesseDeplacement*difficulte
  end

end