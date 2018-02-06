require_relative 'ennemi'
require_relative 'Classes/hitbox'

class Bomber < Ennemi

  attr_accessor :distanceX, :distanceY
  def initialize(image = Gosu::Image.new("../Ressources/enemie_2_fighter_N.png"),
                 degatCollision = 10,
                 degatTir = 100,
                 ptsVie = 100,
                 vitesseDeplacement = 100,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 hero,
                 x,
                 y)
    super
    @distanceX = (hero.hitbox.x + hero.hitbox.width/2) - x
    @distanceY = (hero.hitbox.y + hero.hitbox.width/2) - y
  end

  def seDeplacer(autoScroll, difficulte)
    @x += @dinstanceX/(1/autoScroll)
    @y += @dinstanceY/(1/autoScroll)
  end

end