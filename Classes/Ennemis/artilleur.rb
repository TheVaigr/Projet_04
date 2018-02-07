require_relative 'ennemi'
require_relative '../Armes/mitraillette'

class Artilleur < Ennemi

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
    @arme = Mitraillette.new
    @direction = "gauche"
  end

  def seDeplacer(autoScroll, difficulte, hero)
    if @x == 1920*0.25
      @direction = "droite"
    elsif @x == 1920*0.75-70
      @direction = "gauche"
    end

    if @direction == "gauche"

      @x -= difficulte*5
    else
      @x += difficulte*5
    end

    @y += autoScroll
  end

  def tire
    return Projectile.new("mitraillette", "ennemi",5, @x, @y)
  end
end