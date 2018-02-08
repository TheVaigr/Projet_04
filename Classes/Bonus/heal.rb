require_relative 'bonus'

class Heal < Bonus
  attr_accessor :soin
  def initialize(x, y)
    super x,y
    @x = x
    @y = y
    @vitesse = 3
    @soin = 100
    @image = Gosu::Image.new("../Ressources/missil_1.png")
    @hitbox = Hitbox.new(@x, @y, @image.width, @image.height)

  end

  def draw
    @image.draw(@x, @y, ZOrder::Tir)
  end

  def seDeplace
    @y = @y + @vitesse
  end

  def majHitbox
    @hitbox.x = @x + @image.width/10
    @hitbox.y = @y + @image.height/10
  end


end