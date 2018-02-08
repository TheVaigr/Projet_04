require_relative 'bonus'

class Degat < Bonus
  attr_accessor :degat
  def initialize(x, y)
    super x,y
    @type = "degat"
    @x = x
    @y = y
    @vitesse = 3
    @degat = 10000
    @image = Gosu::Image.new("../Ressources/stats_power.png")
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