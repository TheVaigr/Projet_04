class Acceuil < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Acceuil"
    #@background_image = Gosu::Image.new("../ressources/test.jpg")
    @test1 = Gosu::Image.new("../ressources/ship_1_L.png")
    @font1 = Gosu::Font.new(100)
    @font2 = Gosu::Font.new(60)
    @pos_1 = (width-@font1.text_width("Milky Way Light")) / 2 # Titre
    @pos_2 = (width-@font2.text_width("Jouer")) / 2 # Bouton pour jouer
    @pos_3 = (width-@font2.text_width("Classement")) / 2 # Bouton du classement
    @pos_4 = (width-@font2.text_width("Règles")) / 2 # Bouton des regles
    @pos_5 = (width-@font2.text_width("Quitter")) / 2 # Bouton pour quitter
    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @x = 0
    @y = 0
    @rotation = 0
    @color = Gosu::Color.new(100, 255, 255, 255)
    @curseur == "rien"
  end

  def draw
    #@background_image.draw(0, 0, 0)
      # Dessin des boutton
    @font1.draw("Milky Way Light", @pos_1, 50, 1)
    @font2.draw("Jouer", @pos_2, 250, 1)
    @font2.draw("Classement", @pos_3, 450, 1)
    @font2.draw("Règles", @pos_4, 650, 1)
    @font2.draw("Quitter", @pos_5, 850, 1)

    @test1.draw_rot(@x, @y, 1, @rotation, 0.5,0.5, 1, 1, 0xff_ffffff, :default)

    if @curseur == "jouer"
      @carre = Gosu::draw_rect(850, 230, 220, 100, @color)
    elsif @curseur == "classement"
      @carre = Gosu::draw_rect(780, 430, 360, 100, @color)
    elsif @curseur == "regles"
      @carre = Gosu::draw_rect(840, 630, 240, 100, @color)
    elsif @curseur == "quitter"
      @carre = Gosu::draw_rect(840, 830, 240, 100, @color)
    end
  end

  def needs_cursor?
    true
  end

  # Détection de la localisation de la sourie
  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 1070 && @pos_x > 850 && @pos_y < 330 && @pos_y > 230
        puts "Jouer"
      elsif @pos_x < 1140 && @pos_x > 780 && @pos_y < 530 && @pos_y > 430
        puts "Classement"
      elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 730 && @pos_y > 630
        puts "Regles"
      elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 930 && @pos_y > 830
        puts "Quitter"
      end
    end
  end

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    @x += 1
    @y += 1
    @i += 4
    if @pos_x < 1070 && @pos_x > 850 && @pos_y < 330 && @pos_y > 230
      @curseur = "jouer"
    elsif @pos_x < 1140 && @pos_x > 780 && @pos_y < 530 && @pos_y > 430
      @curseur = "classement"
    elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 730 && @pos_y > 630
      @curseur = "regles"
    elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 930 && @pos_y > 830
      @curseur = "quitter"
    else
      @curseur = "rien"
    end
  end

end