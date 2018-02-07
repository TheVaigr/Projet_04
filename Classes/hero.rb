require_relative 'hitbox'
require_relative 'projectile'
require_relative 'Armes/canon'
require_relative 'Armes/mitraillette'
require_relative 'Armes/arme'

class Hero
  attr_accessor :pseudo, :arme, :armes, :score, :vitesse, :hitbox, :vie

  def initialize(pseudo, couleur, x, y)
    @pseudo = pseudo
    @armes = []
    chargerArmes
    @arme = @armes[0]
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
    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+@image.height, Gosu::Color.new(0xff_00ff00), (@x+@image.width/2)+((-50+@ptsVie)/50)*20, @y+@image.height, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+1+@image.height, Gosu::Color.new(0xff_00ff00), (@x+@image.width/2)+((-50+@ptsVie)/50)*20, @y+1+@image.height, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)+((-50+@ptsVie)/50)*20 , @y+@image.height, Gosu::Color.new(0xff_ff0000), (@x+@image.width/2)+20, @y+@image.height, Gosu::Color.new(0xff_ff0000))
    @ligne = Gosu::draw_line((@x+@image.width/2)+((-50+@ptsVie)/50)*20 , @y+1+@image.height, Gosu::Color.new(0xff_ff0000), (@x+@image.width/2)+20, @y+1+@image.height, Gosu::Color.new(0xff_ff0000))
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

  def tire
    return Projectile.new(@arme.type, "allie", @arme.degat, @x+@hitbox.x/2, @y-@hitbox.y)
  end

  def changeArme
    for i in @armes.size-1
      if @armes[i] == @arme
        if i == @armes.size-1
          @arme = arme[0]
        else
          @arme = @armes
        end
      end
    end
  end

  def chargerArmes
    @armes.push(Mitraillette.new)
    @armes.push(Canon.new)
  end

end
