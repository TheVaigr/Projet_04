require_relative '../hitbox'

class Ennemi

attr_accessor :image, :degatCollision, :degatTir, :vie, :vitesseDeplacement, :vitesseTir, :cadenceTir, :hitbox,:x, :y, :hero, :arme, :vieMax

  def initialize(image, degatCollision, degatTir, vie, vitesseDeplacement, vitesseTir, cadenceTir, x, y)
    @x = x
    @y = y

    @degatCollision = degatCollision
    @degatTir = degatTir
    @vie = vie
    @vieMax = vie
    @vitesseDeplacement = vitesseDeplacement
    @vitesseTir = vitesseTir
    @cadenceTir = cadenceTir

    @image = image
    @song = Gosu::Song.new("../Ressources/music/SFX_enemydie.mp3")
    @hitbox = Hitbox.new(0,0,@image.width*1/3,@image.width*1/3)
  end

  def draw
    @image.draw(@x, @y, ZOrder::Ennemis)
    # barre de point de vie
    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y, Gosu::Color.new(0xff_00ff00),                      (@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40, @y, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40 , @y, Gosu::Color.new(0xff_ff0000),     (@x+@image.width/2)+20, @y, Gosu::Color.new(0xff_ff0000))

    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+1, Gosu::Color.new(0xff_00ff00),                    (@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40, @y+1, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40 , @y+1, Gosu::Color.new(0xff_ff0000),   (@x+@image.width/2)+20, @y+1, Gosu::Color.new(0xff_ff0000))

    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+2, Gosu::Color.new(0xff_00ff00),                    (@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40, @y+2, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40 , @y+2, Gosu::Color.new(0xff_ff0000),   (@x+@image.width/2)+20, @y+2, Gosu::Color.new(0xff_ff0000))
  end

  def estDehors
    if @y > 1080
      return true
    end
    return false
  end

  def estMort
    if @vie < 1
      @song.play
      return true
    end
    return false
  end

  def majHitbox
    @hitbox.x = @x + @image.width/3
    @hitbox.y = @y + @image.height/3
  end


end