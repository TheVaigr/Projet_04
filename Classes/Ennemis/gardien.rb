require_relative 'ennemi'

class Gardien < Ennemi

  def initialize(image = Gosu::Image.new("../Ressources/enemie_5_mamout_N.png"),
                 degatCollision = 100,
                 degatTir = 0,
                 vie = 2000,
                 vitesseDeplacement = 1.5,
                 vitesseTir = 100,
                 cadenceTir = 100,
                 x,
                 y)
    super
    @arme = nil
  end

  def draw
    @image.draw(@x, @y, ZOrder::Ennemis)
    # barre de point de vie
    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+@image.height/4, Gosu::Color.new(0xff_00ff00),                      (@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40, @y+@image.height/4, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40 , @y+@image.height/4, Gosu::Color.new(0xff_ff0000),     (@x+@image.width/2)+20, @y+@image.height/4, Gosu::Color.new(0xff_ff0000))

    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+1+@image.height/4, Gosu::Color.new(0xff_00ff00),                    (@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40, @y+1+@image.height/4, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40 , @y+1+@image.height/4, Gosu::Color.new(0xff_ff0000),   (@x+@image.width/2)+20, @y+1+@image.height/4, Gosu::Color.new(0xff_ff0000))

    @ligne = Gosu::draw_line((@x+@image.width/2)-20, @y+2+@image.height/4, Gosu::Color.new(0xff_00ff00),                    (@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40, @y+2+@image.height/4, Gosu::Color.new(0xff_00ff00))
    @ligne = Gosu::draw_line((@x+@image.width/2)-20+(@vie/@vieMax.to_f)*40 , @y+2+@image.height/4, Gosu::Color.new(0xff_ff0000),   (@x+@image.width/2)+20, @y+2+@image.height/4, Gosu::Color.new(0xff_ff0000))
  end


  def seDeplacer(difficulte)
    @y += @vitesseDeplacement*difficulte
  end

end