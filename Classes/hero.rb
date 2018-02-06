class Hero
  attr_accessor :pseudo
  def initialize(pseudo, arme, couleur, x, y)
    @pseudo = pseudo
    @arme = arme
    @vie = 100
    @vitesse = 5
    @progression = 0
    @score = 0
    @couleur = couleur
    @x = x
    @y = y
    @velocityX = 0.0

    @images = []
    @images.push(Gosu::Image.new("../resources/ship_1_L.png"))
    @images.push(Gosu::Image.new("../resources/ship_1_N.png"))
    @images.push(Gosu::Image.new("../resources/ship_1_R.png"))
    @image = @images[0]
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
  end

  def go_left
    @velocityX -= @vitesse
    # changement de l'image du héros : tourné vers la gauche
    @image = @images[0]
  end

  def go_front
    # changement de l'image du héros : tout droit
    @image = @images[1]
  end

  def go_right
    @velocityX += @vitesse
    # changement de l'image du héros : tourné vers la droite
    @image = @images[2]
  end

  def move
    @x += @velocityX
    @x %= 1920
    @velocityX *= 0.1
  end

  def prendreDegats(degats)
    @vie = @vie - degats
  end

  def estMort
    if @vie < 1
      return true
    end
    return false
  end

end
