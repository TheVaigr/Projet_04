class Hero

  def initialize(pseudo, arme, x, y)
    @pseudo = pseudo
    @arme = arme
    @vie = 100
    @vitesse = 100
    @score = 0
    @x = x
    @y = y
    @velocityX = 0.0

    @images = []
    @images.push(Gosu::Image.new("res/hero/face.png"))
    @images.push(Gosu::Image.new("res/hero/dos.png"))
    @images.push(Gosu::Image.new("res/hero/gauche.png"))
    @images.push(Gosu::Image.new("res/hero/droite.png"))
    @image = @images[0]
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
  end

  def go_left
    @velocityX -= 100
    # changement de l'image du héros : tourné vers la gauche
    @image = @images[0]
  end

  def go_front
    # changement de l'image du héros : tout droit
    @image = @images[1]
  end

  def go_right
    @velocityX += 100
    # changement de l'image du héros : tourné vers la droite
    @image = @images[2]
  end



  def move
    @x += @velocityX
    @x %= 1024
    @y += @velocityY
    @y %= 576
    @velocityX *= 0.1
    @velocityY *= 0.1
  end

end
