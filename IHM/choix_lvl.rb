class Choix_lvl < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Choix du niveau"
    @background_image = Gosu::Image.new("../ressources/test.jpg")
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @font1 = Gosu::Font.new(55)
    @font2 = Gosu::Font.new(40)
    @font3 = Gosu::Font.new(25)
    #@pos_1 = (width-@font1.text_width("Paramètres de la partie")) / 2 # Titre
    @pos_2 = (width-@font2.text_width("Niveau 1")) / 2 # Bouton pour les niveau 1..3
    @pos_3 = (width-@font2.text_width("Niveau infini")) / 2 # Bouton le nievau infini
    @vaisseau = Gosu::Image.new("../ressources/enemie_4_fighter_N.png") # Prend comme paramètre une image d'un vaisseau
    @valeur_niveau = "Niveau 1" # Prend comme paramètre un niveau de difficulté
    @curseur = "rien"

    @color = Gosu::Color.new(100, 255, 255, 255)

    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @i = 0
  end

  def draw
    @background_image.draw(0, 0, 0)
    @font1.draw("Paramètres de la partie", (width-@font1.text_width("Paramètres de la partie"))/2, 30, 1)
      # Dessin des bouttons de changement de vaisseau
    @image.draw(50, 120, 1)
    @image.draw(50, 250, 1)
    @image.draw(50, 380, 1)

    @vaisseau.draw_rot(width/2, 180, 1, @i, 0.5,0.5, 1, 1, 0xff_ffffff, :default)
    @font3.draw(@valeur_niveau, width/2-@font3.text_width(@valeur_niveau)/2, 250, 1)
      # Dessin des bouttons de changement de nievau
    @font2.draw("Niveau 1", @pos_2+380, 120, 1)
    @font2.draw("Niveau 2", @pos_2+380, 220, 1)
    @font2.draw("Niveau 3", @pos_2+380, 320, 1)
    @font2.draw("Niveau infini", @pos_3+380, 420, 1)
      # Dessin des bouttons de changement de page
    @font2.draw("Retour", 200, 520, 1)
    @font2.draw("Jouer", 700, 520, 1)

    if @curseur == "vaisseau 1"
      @ligne = Gosu::draw_line(60, 120, Gosu::Color.new(0xff_ffffff), 60, 200, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(60, 200, Gosu::Color.new(0xff_ffffff), 140, 200, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(140, 200, Gosu::Color.new(0xff_ffffff), 140, 120, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(140, 120, Gosu::Color.new(0xff_ffffff), 60, 120, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 2"
      @ligne = Gosu::draw_line(60, 250, Gosu::Color.new(0xff_ffffff), 60, 330, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(60, 330, Gosu::Color.new(0xff_ffffff), 140, 330, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(140, 330, Gosu::Color.new(0xff_ffffff), 140, 250, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(140, 250, Gosu::Color.new(0xff_ffffff), 60, 250, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 3"
      @ligne = Gosu::draw_line(60, 380, Gosu::Color.new(0xff_ffffff), 60, 460, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(60, 460, Gosu::Color.new(0xff_ffffff), 140, 460, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(140, 460, Gosu::Color.new(0xff_ffffff), 140, 380, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(140, 380, Gosu::Color.new(0xff_ffffff), 60, 380, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "niveau 1"
      @carre = Gosu::draw_rect(780, 105, 225, 70, @color)
    elsif @curseur == "niveau 2"
      @carre = Gosu::draw_rect(780, 205, 225, 70, @color)
    elsif @curseur == "niveau 3"
      @carre = Gosu::draw_rect(780, 305, 225, 70, @color)
    elsif @curseur == "niveau infini"
      @carre = Gosu::draw_rect(780, 405, 225, 70, @color)
    elsif @curseur == "retour"
      @carre = Gosu::draw_rect(180, 510, 150, 60, @color)
    elsif @curseur == "jouer"
      @carre = Gosu::draw_rect(680, 510, 140, 60, @color)
    end
  end

  def needs_cursor?
    true
  end

  # Détection de la localisation de la sourie
  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 140 && @pos_x > 60 && @pos_y < 200 && @pos_y > 120
        @vaisseau = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
      elsif @pos_x < 635 && @pos_x > 60 && @pos_y < 355 && @pos_y > 285
        @vaisseau = Gosu::Image.new("../ressources/enemie_4_fighter_N.png")
      elsif @pos_x < 585 && @pos_x > 60 && @pos_y < 455 && @pos_y > 385
        @vaisseau = Gosu::Image.new("../ressources/ship_1_L.png")
      elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 175 && @pos_y > 105
        @valeur_niveau = "Niveau 1"
      elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 275 && @pos_y > 205
        @valeur_niveau = "Niveau 2"
      elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 375 && @pos_y > 305
        @valeur_niveau = "Niveau 3"
      elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 475 && @pos_y > 405
        @valeur_niveau = "Niveau infini"
      elsif @pos_x < 330 && @pos_x > 180 && @pos_y < 570 && @pos_y > 510
        @a = "retour"
      elsif @pos_x < 820 && @pos_x > 680 && @pos_y < 570 && @pos_y > 510
        @a = "jouer"
      end
    end
  end

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    @i += 2
    if @pos_x < 140 && @pos_x > 60 && @pos_y < 200 && @pos_y > 120
      @curseur = "vaisseau 1"
    elsif @pos_x < 140 && @pos_x > 60 && @pos_y < 320 && @pos_y > 250
      @curseur = "vaisseau 2"
    elsif @pos_x < 140 && @pos_x > 60 && @pos_y < 460 && @pos_y > 380
      @curseur = "vaisseau 3"
    elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 175 && @pos_y > 105
      @curseur = "niveau 1"
    elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 275 && @pos_y > 205
      @curseur = "niveau 2"
    elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 375 && @pos_y > 305
      @curseur = "niveau 3"
    elsif @pos_x < 1005 && @pos_x > 780 && @pos_y < 475 && @pos_y > 405
      @curseur = "niveau infini"
    elsif @pos_x < 330 && @pos_x > 180 && @pos_y < 570 && @pos_y > 510
      @curseur = "retour"
    elsif @pos_x < 820 && @pos_x > 680 && @pos_y < 570 && @pos_y > 510
      @curseur = "jouer"
    else
      @curseur = "rien"
    end
  end

end