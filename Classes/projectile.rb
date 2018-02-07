class Projectile
  attr_accessor :y, :x, :type, :degat, :provenance, :hitbox, :vitesse, :image

  def initialize(type, provenance, degat, x, y)
    @type = type
    @x = x
    @y = y
    @degat = degat
    @provenance = provenance
    @vitesse = vitesse
    defImg
    defHitbox
    defVitesse
  end


  def draw
    @image.draw(@x, @y, ZOrder::Tir)
  end

  def seDeplacer
    if provenance == "allie"
      @y = @y - @vitesse
    else
      @y = @y + @vitesse
    end
  end

  def defHitbox
    if @type == "tir"
      @hitbox = Hitbox.new(@x,@y,@image.width,@image.height)
    else
      @hitbox = Hitbox.new(@x+@image.width/10, @y+@image.height/10, @image.width, @image.height)
    end
  end


  def defImg
    if @type == "mitraillette"
      if @provenance == "allie"
        @image = Gosu::Image.new("../Ressources/missil_1.png")
        puts"proj allie"
      else
        @image = Gosu::Image.new("../Ressources/tire_violet.png")
        puts"proj enn"

      end
    else
      @image = Gosu::Image.new("../Ressources/missil_1.png")
    end
  end

  def defVitesse
    if @type == "Tir"
      @vitesse = 100
    else
      @vitesse = 50
    end
  end

  def majHitbox
    if @type == "tir"
      @hitbox.x = @x
      @hitbox.y = @y
    else
      @hitbox.x = @x + @image.width/10
      @hitbox.y = @y + @image.height/10
    end
  end

end