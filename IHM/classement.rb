class Classement < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Classement"
    @background_image = Gosu::Image.new("../ressources/test.jpg")
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @font1 = Gosu::Font.new(55)
    @font2 = Gosu::Font.new(35)
    @font3 = Gosu::Font.new(25)
    @font4 = Gosu::Font.new(40)
    @curseur = "rien"
    @pos_1 = (width-@font1.text_width("Classement")) / 2 # Titre
    @pos_retour = (width-@font1.text_width("Classement")) / 2 # Bouton acceuil
    @color = Gosu::Color.new(100, 255, 255, 255)
    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @niveau_facile_nom_1 = "marc"
    @niveau_facile_nom_2 = "marc"
    @niveau_facile_nom_3 = "marc"
    @niveau_facile_nom_4 = "marc"
    @niveau_facile_nom_5 = "marc"
    @niveau_moyen_nom_1 = "marc"
    @niveau_moyen_nom_2 = "marc"
    @niveau_moyen_nom_3 = "marc"
    @niveau_moyen_nom_4 = "marc"
    @niveau_moyen_nom_5 = "marc"

  end

  def needs_cursor?
    true
  end

  def draw
    @ligne = Gosu::draw_line(256, 100, Gosu::Color.new(0xff_ffffff), 256, 480, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(512, 100, Gosu::Color.new(0xff_ffffff), 512, 480, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(768, 100, Gosu::Color.new(0xff_ffffff), 768, 480, Gosu::Color.new(0xff_ffffff))
    @font1.draw("Classement", @pos_1, 30, 1)

    # Niveau facile
    @font2.draw(@niveau_facile_nom_1, 128-@font2.text_width(@niveau_facile_nom_1)/2, 110, 1)
    @font3.draw("30", 128-@font3.text_width("30")/2, 150, 1)
    @font2.draw(@niveau_facile_nom_1, 128-@font2.text_width(@niveau_facile_nom_1)/2, 185, 1)
    @font3.draw(" 30", 128-@font3.text_width("30")/2, 225, 1)
    @font2.draw(@niveau_facile_nom_1, 128-@font2.text_width(@niveau_facile_nom_1)/2, 260, 1)
    @font3.draw("30", 128-@font3.text_width("30")/2, 300, 1)
    @font2.draw(@niveau_facile_nom_1, 128-@font2.text_width(@niveau_facile_nom_1)/2, 335, 1)
    @font3.draw("30", 128-@font3.text_width("30")/2, 375, 1)
    @font2.draw(@niveau_facile_nom_1, 128-@font2.text_width(@niveau_facile_nom_1)/2, 410, 1)
    @font3.draw("30", 128-@font3.text_width("30")/2, 450, 1)

    # Niveau moyen
    @font2.draw(@niveau_facile_nom_1, 384-@font2.text_width(@niveau_facile_nom_1)/2, 110, 1)
    @font3.draw("30", 384-@font3.text_width("30")/2, 150, 1)
    @font2.draw(@niveau_facile_nom_1, 384-@font2.text_width(@niveau_facile_nom_1)/2, 185, 1)
    @font3.draw(" 30", 384-@font3.text_width("30")/2, 225, 1)
    @font2.draw(@niveau_facile_nom_1, 384-@font2.text_width(@niveau_facile_nom_1)/2, 260, 1)
    @font3.draw("30", 384-@font3.text_width("30")/2, 300, 1)
    @font2.draw(@niveau_facile_nom_1, 384-@font2.text_width(@niveau_facile_nom_1)/2, 335, 1)
    @font3.draw("30", 384-@font3.text_width("30")/2, 375, 1)
    @font2.draw(@niveau_facile_nom_1, 384-@font2.text_width(@niveau_facile_nom_1)/2, 410, 1)
    @font3.draw("30", 384-@font3.text_width("30")/2, 450, 1)

    # Niveau difficile
    @font2.draw(@niveau_facile_nom_1, 640-@font2.text_width(@niveau_facile_nom_1)/2, 110, 1)
    @font3.draw("30", 640-@font3.text_width("30")/2, 150, 1)
    @font2.draw(@niveau_facile_nom_1, 640-@font2.text_width(@niveau_facile_nom_1)/2, 185, 1)
    @font3.draw(" 30", 640-@font3.text_width("30")/2, 225, 1)
    @font2.draw(@niveau_facile_nom_1, 640-@font2.text_width(@niveau_facile_nom_1)/2, 260, 1)
    @font3.draw("30", 640-@font3.text_width("30")/2, 300, 1)
    @font2.draw(@niveau_facile_nom_1, 640-@font2.text_width(@niveau_facile_nom_1)/2, 335, 1)
    @font3.draw("30", 640-@font3.text_width("30")/2, 375, 1)
    @font2.draw(@niveau_facile_nom_1, 640-@font2.text_width(@niveau_facile_nom_1)/2, 410, 1)
    @font3.draw("30", 640-@font3.text_width("30")/2, 450, 1)

    # Niveau infini
    @font2.draw(@niveau_facile_nom_1, 896-@font2.text_width(@niveau_facile_nom_1)/2, 110, 1)
    @font3.draw("30", 896-@font3.text_width("30")/2, 150, 1)
    @font2.draw(@niveau_facile_nom_1, 896-@font2.text_width(@niveau_facile_nom_1)/2, 185, 1)
    @font3.draw(" 30", 896-@font3.text_width("30")/2, 225, 1)
    @font2.draw(@niveau_facile_nom_1, 896-@font2.text_width(@niveau_facile_nom_1)/2, 260, 1)
    @font3.draw("30", 896-@font3.text_width("30")/2, 300, 1)
    @font2.draw(@niveau_facile_nom_1, 896-@font2.text_width(@niveau_facile_nom_1)/2, 335, 1)
    @font3.draw("30", 896-@font3.text_width("30")/2, 375, 1)
    @font2.draw(@niveau_facile_nom_1, 896-@font2.text_width(@niveau_facile_nom_1)/2, 410, 1)
    @font3.draw("30", 896-@font3.text_width("30")/2, 450, 1)

    # Bouton retour
    @font4.draw("Acceuil", 512-@font4.text_width("Acceuil")/2, 520, 1)

    if @curseur == "acceuil"
      @carre = Gosu::draw_rect(440, 510, 150, 60, @color)
    end
  end

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    if @pos_x < 590 && @pos_x > 440 && @pos_y < 570 && @pos_y > 510
      @curseur = "acceuil"
    else
      @curseur = "rien"
    end
  end

  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 590 && @pos_x > 440 && @pos_y < 570 && @pos_y > 510
        puts "acceuil"
      end
    end
  end

end