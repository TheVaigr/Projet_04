class Classement < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Classement"
    @background_image = Gosu::Image.new("../ressources/test.jpg")
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @font1 = Gosu::Font.new(100)
    @font2 = Gosu::Font.new(50)
    @font3 = Gosu::Font.new(35)
    @font4 = Gosu::Font.new(60)
    @curseur = "rien"
    @pos_1 = (width-@font1.text_width("Classement")) / 2 # Titre
    @pos_retour = (width-@font1.text_width("Classement")) / 2 # Bouton acceuil
    @color = Gosu::Color.new(100, 255, 255, 255)
    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @niveau_facile_nom_1 = "marc"

  end

  def needs_cursor?
    true
  end

  def draw
    @ligne = Gosu::draw_line(480, 310, Gosu::Color.new(0xff_ffffff), 480, 900, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(960, 310, Gosu::Color.new(0xff_ffffff), 960, 900, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(1440, 310, Gosu::Color.new(0xff_ffffff), 1440, 900, Gosu::Color.new(0xff_ffffff))
    @font1.draw("Classement", @pos_1, 30, 1)
    # Niveau facile
    @font4.draw("Niveau facile", 240-@font4.text_width("Niveau facile")/2, 250, 1)
    @font2.draw(@niveau_facile_nom_1, 240-@font2.text_width(@niveau_facile_nom_1)/2, 360, 1)
    @font3.draw("30", 240-@font3.text_width("30")/2, 410, 1)
    @font2.draw(@niveau_facile_nom_1, 240-@font2.text_width(@niveau_facile_nom_1)/2, 470, 1)
    @font3.draw("30", 240-@font3.text_width("30")/2, 520, 1)
    @font2.draw(@niveau_facile_nom_1, 240-@font2.text_width(@niveau_facile_nom_1)/2, 580, 1)
    @font3.draw("30", 240-@font3.text_width("30")/2, 630, 1)
    @font2.draw(@niveau_facile_nom_1, 240-@font2.text_width(@niveau_facile_nom_1)/2, 690, 1)
    @font3.draw("30", 240-@font3.text_width("30")/2, 740, 1)
    @font2.draw(@niveau_facile_nom_1, 240-@font2.text_width(@niveau_facile_nom_1)/2, 800, 1)
    @font3.draw("30", 240-@font3.text_width("30")/2, 850, 1)
    # Niveau moyen
    @font4.draw("Niveau moyen", 720-@font4.text_width("Niveau moyen")/2, 250, 1)
    @font2.draw(@niveau_facile_nom_1, 720-@font2.text_width(@niveau_facile_nom_1)/2, 360, 1)
    @font3.draw("30", 720-@font3.text_width("30")/2, 410, 1)
    @font2.draw(@niveau_facile_nom_1, 720-@font2.text_width(@niveau_facile_nom_1)/2, 470, 1)
    @font3.draw(" 30", 720-@font3.text_width("30")/2, 520, 1)
    @font2.draw(@niveau_facile_nom_1, 720-@font2.text_width(@niveau_facile_nom_1)/2, 580, 1)
    @font3.draw("30", 720-@font3.text_width("30")/2, 630, 1)
    @font2.draw(@niveau_facile_nom_1, 720-@font2.text_width(@niveau_facile_nom_1)/2, 690, 1)
    @font3.draw("30", 720-@font3.text_width("30")/2, 740, 1)
    @font2.draw(@niveau_facile_nom_1, 720-@font2.text_width(@niveau_facile_nom_1)/2, 800, 1)
    @font3.draw("30", 720-@font3.text_width("30")/2, 850, 1)
    # Niveau difficile
    @font4.draw("Niveau difficile", 1200-@font4.text_width("Niveau difficile")/2, 250, 1)
    @font2.draw(@niveau_facile_nom_1, 1200-@font2.text_width(@niveau_facile_nom_1)/2, 360, 1)
    @font3.draw("30", 1200-@font3.text_width("30")/2, 410, 1)
    @font2.draw(@niveau_facile_nom_1, 1200-@font2.text_width(@niveau_facile_nom_1)/2, 470, 1)
    @font3.draw(" 30", 1200-@font3.text_width("30")/2, 520, 1)
    @font2.draw(@niveau_facile_nom_1, 1200-@font2.text_width(@niveau_facile_nom_1)/2, 580, 1)
    @font3.draw("30", 1200-@font3.text_width("30")/2, 630, 1)
    @font2.draw(@niveau_facile_nom_1, 1200-@font2.text_width(@niveau_facile_nom_1)/2, 690, 1)
    @font3.draw("30", 1200-@font3.text_width("30")/2, 740, 1)
    @font2.draw(@niveau_facile_nom_1, 1200-@font2.text_width(@niveau_facile_nom_1)/2, 800, 1)
    @font3.draw("30", 1200-@font3.text_width("30")/2, 850, 1)
    # Niveau évolutif
    @font4.draw("Niveau évolutif", 1680-@font4.text_width("Niveau évolutif")/2, 250, 1)
    @font2.draw(@niveau_facile_nom_1, 1680-@font2.text_width(@niveau_facile_nom_1)/2, 360, 1)
    @font3.draw("30", 1680-@font3.text_width("30")/2, 410, 1)
    @font2.draw(@niveau_facile_nom_1, 1680-@font2.text_width(@niveau_facile_nom_1)/2, 470, 1)
    @font3.draw(" 30", 1680-@font3.text_width("30")/2, 520, 1)
    @font2.draw(@niveau_facile_nom_1, 1680-@font2.text_width(@niveau_facile_nom_1)/2, 580, 1)
    @font3.draw("30", 1680-@font3.text_width("30")/2, 630, 1)
    @font2.draw(@niveau_facile_nom_1, 1680-@font2.text_width(@niveau_facile_nom_1)/2, 690, 1)
    @font3.draw("30", 1680-@font3.text_width("30")/2, 740, 1)
    @font2.draw(@niveau_facile_nom_1, 1680-@font2.text_width(@niveau_facile_nom_1)/2, 800, 1)
    @font3.draw("30", 1680-@font3.text_width("30")/2, 850, 1)
    # Bouton retour
    @font4.draw("Acceuil", 960-@font4.text_width("Acceuil")/2, 950, 1)

    if @curseur == "acceuil"
      @carre = Gosu::draw_rect(830, 930, 260, 100, @color)
    end
  end

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    if @pos_x < 1000 && @pos_x > 800 && @pos_y < 1030 && @pos_y > 930
      @curseur = "acceuil"
    else
      @curseur = "rien"
    end
  end

  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 1000 && @pos_x > 800 && @pos_y < 1030 && @pos_y > 930
        puts "acceuil"
      end
    end
  end

end