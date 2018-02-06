class Ennemi

  def initialize(image, degatCollision, degatTir, ptsVie, vitesseDeplacement, vitesseTir, cadenceTir, hitbox, x, y)
    @x = x
    @y = y

    @degatCollision = degatCollision
    @degatTir = degatTir
    @ptsVie = ptsVie
    @vitesseDeplacement = vitesseDeplacement
    @vitesseTir = vitesseTir
    @cadenceTir = cadenceTir


    @image = image
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


end