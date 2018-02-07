require_relative 'ennemi'

class Gardien < Ennemi

  def initialize(image = Gosu::Image.new("../Ressources/enemie_2_fighter_N.png"),
                 degatCollision = 10,
                 degatTir = 100,
                 ptsVie = 100,
                 vitesseDeplacement = 100,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 x,
                 y)
    super
    @arme = NIL
  end

  def seDeplacer(autoScroll, difficulte, hero)

    @y += autoScroll
  end

end