require_relative 'hitbox'
require_relative 'projectile'
require_relative 'Armes/canon'
require_relative 'Armes/mitraillette'
require_relative 'Armes/arme'
require_relative 'Armes/missile'

class Hero
  attr_accessor :pseudo, :arme, :armes, :score, :vitesse, :hitbox, :vie, :x, :y, :image, :vieMax, :couleur, :burst

  def initialize(pseudo, couleur, x, y)
    @pseudo = pseudo
    @armes = []
    chargerArmes
    @arme = @armes[0]
    @vieMax = 100
    @vie = @vieMax
    @vitesse = 10
    @progression = 0
    @score = 0
    @couleur = couleur
    @x = x
    @y = y
    @velocityX = 0.0
    @image = Gosu::Image.new("../Ressources/ship_1_N.png")
    @hitbox = Hitbox.new(@x,@y,@image.width*1/3,@image.width*1/3)
    @r = Random.new
    @burst = false
    @i=0
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
    # barre de vie
    @ligne = Gosu::draw_line((@x+@image.width/2)-30, @y+@image.height, Gosu::Color.new(0xff_00ff00),                      (@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60, @y+@image.height, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60 , @y+@image.height, Gosu::Color.new(0xff_ff0000),     (@x+@image.width/2)+30, @y+@image.height, Gosu::Color.new(0xff_ff0000))

    @ligne = Gosu::draw_line((@x+@image.width/2)-30, @y-1+@image.height, Gosu::Color.new(0xff_00ff00),                    (@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60, @y-1+@image.height, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60 , @y-1+@image.height, Gosu::Color.new(0xff_ff0000),   (@x+@image.width/2)+30, @y+@image.height-1, Gosu::Color.new(0xff_ff0000))

    @ligne = Gosu::draw_line((@x+@image.width/2)-30, @y-2+@image.height, Gosu::Color.new(0xff_00ff00),                    (@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60, @y+@image.height-2, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60 , @y-2+@image.height, Gosu::Color.new(0xff_ff0000),   (@x+@image.width/2)+30, @y+@image.height-2, Gosu::Color.new(0xff_ff0000))

    @ligne = Gosu::draw_line((@x+@image.width/2)-30, @y-3+@image.height, Gosu::Color.new(0xff_00ff00),                    (@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60, @y+@image.height-3, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-30+(@vie/@vieMax.to_f)*60 , @y-3+@image.height, Gosu::Color.new(0xff_ff0000),   (@x+@image.width/2)+30, @y+@image.height-3, Gosu::Color.new(0xff_ff0000))
  end

  def go_left
    @velocityX -= @vitesse
    # changement de l'image du héros : tourné vers la gauche
    if @couleur == "vert"
      @image = Gosu::Image.new("../Ressources/ship_1_L.png")
    elsif @couleur == "bleu"
      @image = Gosu::Image.new("../Ressources/ship_2_L.png")
    else @couleur == "jaune"
      @image = Gosu::Image.new("../Ressources/ship_3_L.png")
    end
  end

  def go_front
    # changement de l'image du héros : tout droit
    if @couleur == "vert"
      @image = Gosu::Image.new("../Ressources/ship_1_N.png")
    elsif @couleur == "bleu"
      @image = Gosu::Image.new("../Ressources/ship_2_N.png")
    else @couleur == "jaune"
    @image = Gosu::Image.new("../Ressources/ship_3_N.png")
    end
  end

  def go_right
    @velocityX += @vitesse
    # changement de l'image du héros : tourné vers la droite
    if @couleur == "vert"
      @image = Gosu::Image.new("../Ressources/ship_1_R.png")
    elsif @couleur == "bleu"
      @image = Gosu::Image.new("../Ressources/ship_2_R.png")
    else @couleur == "jaune"
    @image = Gosu::Image.new("../Ressources/ship_3_R.png")
    end
  end

  def move
    @x += @velocityX
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
    @hitbox.x = @x + @image.width/3
    @hitbox.y = @y + @image.height/3
  end

  def tire
    projectiles = []
    if @arme.type == "mitraillette"
      projectiles.push(Projectile.new(@arme.vitesseTir, @arme.type, "allie", @arme.degat, @x+ @image.width/2+12, @y + @image.height/3,0))
      projectiles.push(Projectile.new(@arme.vitesseTir, @arme.type, "allie", @arme.degat, @x+ @image.width/2, @y + @image.height/3-5,0))
      projectiles.push(Projectile.new(@arme.vitesseTir, @arme.type, "allie", @arme.degat, @x+ @image.width/2-12, @y + @image.height/3,0))
    else
      projectiles.push(Projectile.new(@arme.vitesseTir, @arme.type, "allie", @arme.degat, @x+ @image.width/2, @y + @image.height/3,0))
    end
    return projectiles
  end

  def changeArme
    @i = @i + 1
    @arme = @armes[@i % @armes.size]
  end

  def chargerArmes
    @armes.push(Mitraillette.new)
    @armes.push(Canon.new)
    @armes.push(Missile.new)
  end

end
