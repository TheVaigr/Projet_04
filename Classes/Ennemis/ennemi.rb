require_relative '../hitbox'

class Ennemi
attr_accessor :image, :degatCollision, :degatTir, :ptsVie, :vitesseDeplacement, :vitesseTir, :cadenceTir, :hitbox,:x, :y, :hero
  def initialize(image, degatCollision, degatTir, ptsVie, vitesseDeplacement, vitesseTir, cadenceTir, x, y)
    @x = x
    @y = y

    @degatCollision = degatCollision
    @degatTir = degatTir
    @ptsVie = ptsVie
    @vitesseDeplacement = vitesseDeplacement
    @vitesseTir = vitesseTir
    @cadenceTir = cadenceTir

    @image = image
    @hitbox = Hitbox.new(0,0,@image.width*1/3,@image.width*1/3)
  end

  def draw
    @image.draw(@x, @y, ZOrder::Ennemis)
  end

  def estMort
    if @y > 1080
      return true
    end
    return false
  end

  def majHitbox
    @hitbox.x = @x + 1/3 * @image.width
    @hitbox.y = @y + 1/3 * @image.height
  end

end