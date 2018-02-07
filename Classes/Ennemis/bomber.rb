require_relative 'ennemi'

class Bomber < Ennemi

  attr_accessor :distanceX, :distanceY
  def initialize(image = Gosu::Image.new("../Ressources/enemie_4_fighter_N.png"),
                 degatCollision = 50,
                 degatTir = 100,
                 vie = 100,
                 vitesseDeplacement = 100,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 x,
                 y)
    super
    @arme = nil
  end

  def seDeplacer(difficulte)
    if @x <= 480.0
      @direction = "droite"
    elsif @x >= 1440.0-100
      @direction = "gauche"
    end

    if @direction == "gauche"

      @x -= difficulte*4
    else
      @x += difficulte*4
    end

    @y += difficulte*4
  end

end