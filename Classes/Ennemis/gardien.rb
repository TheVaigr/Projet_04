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
    @direction = "gauche"
  end

  def seDeplacer(autoScroll, difficulte)
    if @x == 0
      @direction = "droite"
    elsif @x == 1920-70
      @direction = "gauche"
    end

    if @direction == "gauche"
      @x -= difficulte*5
    else
      @x += difficulte*5
    end

    @y += autoScroll
  end

end