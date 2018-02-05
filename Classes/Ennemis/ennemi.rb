class Ennemi

  def initialize(image, degatCollision, degat, ptsVie, vitesseDeplacement, vitesseTir, cadenceTir, x, y)
    @x = x
    @y = y

    @degatCollision = degatCollision
    @degatTir = degat
    @ptsVie = ptsVie
    @vitesseDeplacement = vitesseDeplacement
    @vitesseTir = vitesseTir
    @cadenceTir = cadenceTir

    @image = image
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
  end

end