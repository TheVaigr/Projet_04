class Acceuil < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Acceuil"
    @background_image = Gosu::Image.new("../ressources/test.jpg")
    @test1 = Gosu::Image.new("../ressources/ship_1_L.png")
    @font1 = Gosu::Font.new(70)
    @font2 = Gosu::Font.new(40)
    @pos_1 = (width-@font1.text_width("Milky Way Light")) / 2 # Titre
    @pos_2 = (width-@font2.text_width("Jouer")) / 2 # Bouton pour jouer
    @pos_3 = (width-@font2.text_width("Classement")) / 2 # Bouton du classement
    @pos_4 = (width-@font2.text_width("Règles")) / 2 # Bouton des regles
    @pos_5 = (width-@font2.text_width("Quitter")) / 2 # Bouton pour quitter
    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @x = 0
    @y = 0
    @i = 0
    @color = Gosu::Color.new(100, 255, 255, 255)
    @curseur == "rien"
  end

  def draw
    @background_image.draw(0, 0, 0)
      # Dessin des boutton
    @font1.draw("Milky Way Light", @pos_1, 70, 1)
    @font2.draw("Jouer", @pos_2, 200, 1)
    @font2.draw("Classement", @pos_3, 300, 1)
    @font2.draw("Règles", @pos_4, 400, 1)
    @font2.draw("Quitter", @pos_5, 500, 1)

    @test1.draw_rot(@x, @y, 1, @i, 0.5,0.5, 1, 1, 0xff_ffffff, :default)

    if @curseur == "jouer"
      @carre = Gosu::draw_rect(440, 185, 145, 70, @color)
    elsif @curseur == "classement"
      @carre = Gosu::draw_rect(390, 285, 245, 70, @color)
    elsif @curseur == "regles"
      @carre = Gosu::draw_rect(435, 385, 150, 70, @color)
    elsif @curseur == "quitter"
      @carre = Gosu::draw_rect(435, 485, 150, 70, @color)
    end
  end

  def needs_cursor?
    true
  end

  # Détection de la localisation de la sourie
  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 585 && @pos_x > 440 && @pos_y < 255 && @pos_y > 185
        puts "Jouer"
      elsif @pos_x < 635 && @pos_x > 390 && @pos_y < 355 && @pos_y > 285
        puts "Classement"
      elsif @pos_x < 585 && @pos_x > 435 && @pos_y < 455 && @pos_y > 385
        puts "Regles"
      elsif @pos_x < 585 && @pos_x > 435 && @pos_y < 555 && @pos_y > 485
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
    if @pos_x < 585 && @pos_x > 440 && @pos_y < 255 && @pos_y > 185
      @curseur = "jouer"
    elsif @pos_x < 635 && @pos_x > 390 && @pos_y < 355 && @pos_y > 285
      @curseur = "classement"
    elsif @pos_x < 585 && @pos_x > 435 && @pos_y < 455 && @pos_y > 385
      @curseur = "regles"
    elsif @pos_x < 585 && @pos_x > 435 && @pos_y < 555 && @pos_y > 485
      @curseur = "quitter"
    else
      @curseur = "rien"
    end
  end

end