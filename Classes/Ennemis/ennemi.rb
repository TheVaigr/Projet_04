require_relative '../hitbox'

class Ennemi

attr_accessor :image, :degatCollision, :degatTir, :vie, :vitesseDeplacement, :vitesseTir, :cadenceTir, :hitbox,:x, :y, :hero, :arme

  def initialize(image, degatCollision, degatTir, vie, vitesseDeplacement, vitesseTir, cadenceTir, x, y)
    @x = x
    @y = y

    @degatCollision = degatCollision
    @degatTir = degatTir
    @vie = vie
    @vitesseDeplacement = vitesseDeplacement
    @vitesseTir = vitesseTir
    @cadenceTir = cadenceTir

    @image = image

    @hitbox = Hitbox.new(0,0,@image.width*1/3,@image.width*1/3)
  end

  def draw
    @image.draw(@x, @y, ZOrder::Ennemis)
    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y, Gosu::Color.new(0xff_00ff00), (@x+@image.width/2)+((-50+@ptsVie)/50)*20, @y, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+1, Gosu::Color.new(0xff_00ff00), (@x+@image.width/2)+((-50+@ptsVie)/50)*20, @y+1, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)+((-50+@ptsVie)/50)*20 , @y, Gosu::Color.new(0xff_ff0000), (@x+@image.width/2)+20, @y, Gosu::Color.new(0xff_ff0000))
    @ligne = Gosu::draw_line((@x+@image.width/2)+((-50+@ptsVie)/50)*20 , @y+1, Gosu::Color.new(0xff_ff0000), (@x+@image.width/2)+20, @y+1, Gosu::Color.new(0xff_ff0000))
  end

  def estMort
    if @y > 1080 || vie < 1
      return true
    end
    return false
  end

  def majHitbox
    @hitbox.x = @x + 1/3 * @image.width
    @hitbox.y = @y + 1/3 * @image.height
  end


end