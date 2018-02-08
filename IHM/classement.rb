class Classement < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Classement"
    @background_image = Gosu::Image.new("../ressources/test.jpg")
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @font1 = Gosu::Font.new(100)
    @font2 = Gosu::Font.new(60)
    @font4 = Gosu::Font.new(50)
    @font5 = Gosu::Font.new(35)
    @curseur = "rien"
    @pos_6 = (width-@font1.text_width("Classement")) / 2 # Titre
    @pos_retour = (width-@font1.text_width("Retour")) / 2 # Bouton acceuil
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
    @font1.draw("Classement", @pos_6, 30, 1)
    # Niveau facile
    @font2.draw("Niveau facile", 240-@font2.text_width("Niveau facile")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursScore[1,0], 240-@font4.text_width(@model.meilleursJoueursScore[1,0])/2, 360, 1)
    @font5.draw("30", 240-@font5.text_width("30")/2, 410, 1)
    @font4.draw(@model.meilleursJoueursScore[1,1], 240-@font4.text_width(@model.meilleursJoueursScore[1,1])/2, 470, 1)
    @font5.draw("30", 240-@font5.text_width("30")/2, 520, 1)
    @font4.draw(@model.meilleursJoueursScore[1,2], 240-@font4.text_width(@model.meilleursJoueursScore[1,2])/2, 580, 1)
    @font5.draw("30", 240-@font5.text_width("30")/2, 630, 1)
    @font4.draw(@model.meilleursJoueursScore[1,3], 240-@font4.text_width(@model.meilleursJoueursScore[1,3])/2, 690, 1)
    @font5.draw("30", 240-@font5.text_width("30")/2, 740, 1)
    @font4.draw(@model.meilleursJoueursScore[1,4], 240-@font4.text_width(@model.meilleursJoueursScore[1,4])/2, 800, 1)
    @font5.draw("30", 240-@font5.text_width("30")/2, 850, 1)
    # Niveau moyen
    @font2.draw("Niveau moyen", 720-@font2.text_width("Niveau moyen")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursScore[2,0], 720-@font4.text_width(@model.meilleursJoueursScore[2,0])/2, 360, 1)
    @font5.draw("30", 720-@font5.text_width("30")/2, 410, 1)
    @font4.draw(@model.meilleursJoueursScore[2,1], 720-@font4.text_width(@model.meilleursJoueursScore[2,1])/2, 470, 1)
    @font5.draw(" 30", 720-@font5.text_width("30")/2, 520, 1)
    @font4.draw(@model.meilleursJoueursScore[2,2], 720-@font4.text_width(@model.meilleursJoueursScore[2,2])/2, 580, 1)
    @font5.draw("30", 720-@font5.text_width("30")/2, 630, 1)
    @font4.draw(@model.meilleursJoueursScore[2,3], 720-@font4.text_width(@model.meilleursJoueursScore[2,3])/2, 690, 1)
    @font5.draw("30", 720-@font5.text_width("30")/2, 740, 1)
    @font4.draw(@model.meilleursJoueursScore[2,4], 720-@font4.text_width(@model.meilleursJoueursScore[2,4])/2, 800, 1)
    @font5.draw("30", 720-@font5.text_width("30")/2, 850, 1)
    # Niveau difficile
    @font2.draw("Niveau difficile", 1200-@font2.text_width("Niveau difficile")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursScore[3,0], 1200-@font4.text_width(@model.meilleursJoueursScore[3,0])/2, 360, 1)
    @font5.draw("30", 1200-@font5.text_width("30")/2, 410, 1)
    @font4.draw(@model.meilleursJoueursScore[3,1], 1200-@font4.text_width(@model.meilleursJoueursScore[3,1])/2, 470, 1)
    @font5.draw(" 30", 1200-@font5.text_width("30")/2, 520, 1)
    @font4.draw(@model.meilleursJoueursScore[3,2], 1200-@font4.text_width(@model.meilleursJoueursScore[3,2])/2, 580, 1)
    @font5.draw("30", 1200-@font5.text_width("30")/2, 630, 1)
    @font4.draw(@model.meilleursJoueursScore[3,3], 1200-@font4.text_width(@model.meilleursJoueursScore[3,3])/2, 690, 1)
    @font5.draw("30", 1200-@font5.text_width("30")/2, 740, 1)
    @font4.draw(@model.meilleursJoueursScore[3,4], 1200-@font4.text_width(@model.meilleursJoueursScore[3,4])/2, 800, 1)
    @font5.draw("30", 1200-@font5.text_width("30")/2, 850, 1)
    # Niveau évolutif
    @font2.draw("Niveau évolutif", 1680-@font2.text_width("Niveau évolutif")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursScore[4,0], 1680-@font4.text_width(@model.meilleursJoueursScore[4,0])/2, 360, 1)
    @font5.draw("30", 1680-@font5.text_width("30")/2, 410, 1)
    @font4.draw(@model.meilleursJoueursScore[4,1], 1680-@font4.text_width(@model.meilleursJoueursScore[4,1])/2, 470, 1)
    @font5.draw(" 30", 1680-@font5.text_width("30")/2, 520, 1)
    @font4.draw(@model.meilleursJoueursScore[4,2], 1680-@font4.text_width(@model.meilleursJoueursScore[4,2])/2, 580, 1)
    @font5.draw("30", 1680-@font5.text_width("30")/2, 630, 1)
    @font4.draw(@model.meilleursJoueursScore[4,3], 1680-@font4.text_width(@model.meilleursJoueursScore[4,3])/2, 690, 1)
    @font5.draw("30", 1680-@font5.text_width("30")/2, 740, 1)
    @font4.draw(@model.meilleursJoueursScore[4,4], 1680-@font4.text_width(@model.meilleursJoueursScore[4,4])/2, 800, 1)
    @font5.draw("30", 1680-@font5.text_width("30")/2, 850, 1)
    # Bouton retour
    @font2.draw("Acceuil", 960-@font2.text_width("Acceuil")/2, 950, 1)

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