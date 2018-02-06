require_relative 'hitbox'

class Hero
  attr_accessor :pseudo, :armes, :score, :vitesse, :hitbox, :vie

  def initialize(pseudo, couleur, x, y)
    @pseudo = pseudo
    @armes = []
    @vie = 100
    @vitesse = 5
    @progression = 0
    @score = 0
    @couleur = couleur
    @x = x
    @y = y
    @velocityX = 0.0
    @image = Gosu::Image.new("../Ressources/ship_1_N.png")
    @hitbox = Hitbox.new(@x,@y,@image.width*1/3,@image.width*1/3)
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
  end

  def go_left
    @velocityX -= @vitesse
    # changement de l'image du héros : tourné vers la gauche
    @image = Gosu::Image.new("../Ressources/ship_1_L.png")
  end

  def go_front
    # changement de l'image du héros : tout droit
    @image = Gosu::Image.new("../Ressources/ship_1_N.png")
  end

  def go_right
    @velocityX += @vitesse
    # changement de l'image du héros : tourné vers la droite
    @image = Gosu::Image.new("../Ressources/ship_1_R.png")
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

  def majHitbox
    @hitbox.x = @x + 1/3 * @image.width
    @hitbox.y = @y + 1/3 * @image.height
  end

end
