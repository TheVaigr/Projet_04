require_relative 'ennemi'

class Bomber < Ennemi

  attr_accessor :distanceX, :distanceY
  def initialize(image = Gosu::Image.new("../Ressources/enemie_4_fighter_N.png"),
                 degatCollision = 30,
                 degatTir = 100,
                 vie = 150,
                 vitesseDeplacement = 100,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 x,
                 y)
    super
    @arme = nil
    r = Random.new
    if r.rand(0...2) == 0
      @direction = "gauche"
    end
  end

  def seDeplacer(difficulte)
    if @x <= 480.0
      @direction = "droite"
    elsif @x >= 1440.0-100
      @direction = "gauche"
    end

    if @direction == "gauche"
      @x -= difficulte+7
    else
      @x += difficulte+7
    end

    @y += difficulte+7
  end

end