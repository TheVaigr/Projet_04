require_relative 'ennemi'
require_relative '../Armes/mitraillette'

class Artilleur < Ennemi
  attr_accessor :arme
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

  def tire
    return Projectile.new("mitraillette", "ennemi", @arme.degat, @x+@hitbox.x/2, @y+@hitbox.y)
  end
end