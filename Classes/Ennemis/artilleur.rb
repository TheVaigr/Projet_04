require_relative 'ennemi'
require_relative '../Armes/mitraillette'

class Artilleur < Ennemi

  def initialize(image = Gosu::Image.new("../Ressources/enemie_2_fighter_N.png"),
                 degatCollision = 10,
                 degatTir = 100,
                 vie = 100,
                 vitesseDeplacement = 100,
                 vitesseTir = 10,
                 cadenceTir = 100,
                 x,
                 y)
    super
    @arme = Mitraillette.new
    @direction = "gauche"
  end

  def seDeplacer(autoScroll, difficulte, hero)
    if @x <= 480.0
      @direction = "droite"
    elsif @x >= 1440.0
      @direction = "gauche"
    end

    if @direction == "gauche"

      @x -= difficulte*3
    else
      @x += difficulte*3
    end

    @y += autoScroll
  end

  def tire
    return Projectile.new(@vitesseTir,"mitraillette", "ennemi",5, @x + @image.width/2, @y + @image.height*(2/3))
  end
end