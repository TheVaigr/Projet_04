require 'gosu'

require_relative '../Classes/hero'
require_relative '../Classes/Ennemis/gardien'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/Hitbox'

class Model

  attr_accessor :hero, :niveauDifficulte

  def initialize(pseudo, couleur, width, height)
    @hero = Hero.new(pseudo, couleur, width/2, height-150)
  end

  def collision(hitbox1, hitbox2)
    if (hitbox1.x < hitbox2.x + hitbox2.width &&
        hitbox1.x + hitbox1.width > hitbox2.x &&
        hitbox1.y < hitbox2.y + hitbox2.height &&
        hitbox1.height + hitbox1.y > hitbox2.y)
        return true
    end
  end

  def getCadenceTirArtilleur
    @artilleur = Artilleur.new(0,0)
    return @artilleur.cadenceTir
  end

end