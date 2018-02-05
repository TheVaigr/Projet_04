class Ennemi

  def initialize(image, degatCollision, degatTir, ptsVie, vitesseDeplacement, vitesseTir, cadenceTir, x, y)
    @x = x
    @y = y

    @degatCollision = degatCollision
    @degatTir = degatTir
    @ptsVie = ptsVie
    @vitesseDeplacement = vitesseDeplacement
    @vitesseTir = vitesseTir
    @cadenceTir = cadenceTir
    @direction = "gauche"

    @image = image
  end

  def draw
    @image.draw(@x, @y, ZOrder::Ennemis)
  end

  def seDeplacer(autoScroll, difficulte)
    if @x == 0
      @direction = "droite"
    elsif @x == 1920-50
      @direction = "gauche"
    end

    if @direction == "gauche"
      @x -= difficulte*5
    else
      @x += difficulte*5
    end

    @y += autoScroll
  end

  def estMort
    if @y > 1080
      return true
    end
  end

end