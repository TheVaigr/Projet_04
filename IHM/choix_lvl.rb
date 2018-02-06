class Choix_lvl < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Choix du niveau"
    @vaisseau = Gosu::Image.new("../ressources/enemie_4_fighter_N.png")
    @background_image = Gosu::Image.new("../ressources/test.jpg")
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @font1 = Gosu::Font.new(55)
    @font2 = Gosu::Font.new(40)
    @pos_1 = (width-@font1.text_width("Paramètres de la partie")) / 2 # Titre
    @pos_2 = (width-@font2.text_width("Niveau 1")) / 2 # Bouton pour les niveau 1..3
    @pos_3 = (width-@font2.text_width("Niveau infini")) / 2 # Bouton le nievau infini


    @test = Gosu::Color.new(100, 204, 204, 204)

    @pos_5 = (width-@font2.text_width("Niveau 2")) / 2 # Bouton du classement
    @pos_4 = (width-@font2.text_width("Niveau 3")) / 2 # Bouton des regles
    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @i = 1
  end

  def draw
    @background_image.draw(0, 0, 0)
    @font1.draw("Paramètres de la partie", @pos_1, 30, 1)
    @image.draw(50, 100, 1)
    @image.draw(50, 250, 1)
    @image.draw(50, 400, 1)
    @vaisseau.draw_rot(width/2-@image.width/2, 180, 1, @i, 0.5,0.5, 1, 1, 0xff_ffffff, :default)


    @font2.draw("Niveau 1", @pos_2+380, 100, 1)
    @carre = Gosu::draw_rect(810, 100, 170, 45, @test)
    @font2.draw("Niveau 2", @pos_2+380, 200, 1)
    @font2.draw("Niveau 3", @pos_2+380, 300, 1)
    @font2.draw("Niveau infini", @pos_3+380, 400, 1)
  end


  def needs_cursor?
    true
  end

  # Détection de la localisation de la sourie
  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 585 && @pos_x > 435 && @pos_y < 255 && @pos_y > 185
        puts "Niveau 1"
        @vaisseau = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
      elsif @pos_x < 635 && @pos_x > 385 && @pos_y < 355 && @pos_y > 285
        puts "Niveau 2"
        @vaisseau = Gosu::Image.new("../ressources/enemie_4_fighter_N.png")
      elsif @pos_x < 585 && @pos_x > 435 && @pos_y < 455 && @pos_y > 385
        puts "Niveau 3"
        @vaisseau = Gosu::Image.new("../ressources/ship_1_L.png")
      elsif @pos_x < 585 && @pos_x > 435 && @pos_y < 555 && @pos_y > 485
        puts "Niveau infini"
      end
      puts @pos_x
      puts @pos_y
    end
  end

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    @i += 2
  end


end