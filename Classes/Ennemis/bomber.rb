require_relative 'ennemi'

class Bomber < Ennemi

  attr_accessor :distanceX, :distanceY
  def initialize(image = Gosu::Image.new("../Ressources/enemie_2_fighter_N.png"),
                 degatCollision = 50,
                 degatTir = 100,
                 ptsVie = 100,
                 vitesseDeplacement = 100,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 x,
                 y)
    super

  end

  def seDeplacer(autoScroll, difficulte, hero)
    @distanceX = @x - (hero.hitbox.x + hero.hitbox.width/2)
    @distanceY = @y - (hero.hitbox.y + hero.hitbox.width/2)

    @x = @x - @distanceX/99
    @y = @y + autoScroll
    autoScroll = difficulte
  end

end