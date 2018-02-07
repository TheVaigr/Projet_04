require_relative 'ennemi'
require_relative '../Armes/mitraillette'

class Artilleur < Ennemi

  def initialize(image = Gosu::Image.new("../Ressources/enemie_2_fighter_N.png"),
                 degatCollision = 10,
                 degatTir = 20,
                 vie = 100,
                 vitesseDeplacement = 100,
                 vitesseTir = 3,
                 cadenceTir = 60,
                 x,
                 y)
    super
    @arme = Mitraillette.new
  end

  def seDeplacer(difficulte)
    @y += 1.5
  end

  def tire
    return Projectile.new(@vitesseTir,"mitraillette", "ennemi",@degatTir, @x + @image.width/2, @y + @image.height*0.7)
  end
end