class Choix_lvl < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Choix du niveau"
    #@background_image = Gosu::Image.new("../ressources/test.jpg")
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @vaisseau1 = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @vaisseau2 = Gosu::Image.new("../ressources/enemie_4_fighter_N.png")
    @vaisseau3 = Gosu::Image.new("../ressources/enemie_2_heavyfighter_N.png")
    @font1 = Gosu::Font.new(100)
    @font2 = Gosu::Font.new(60)
    @font3 = Gosu::Font.new(40)
    @pos_1 = (width-@font1.text_width("Paramètres de la partie")) / 2 # Titre
    @vaisseau = Gosu::Image.new("../ressources/enemie_4_fighter_N.png") # Prend comme paramètre une image d'un vaisseau
    @valeur_niveau = "Niveau facile" # Prend comme paramètre un niveau de difficulté
    @curseur = "rien"
    @nom = ""
    @color = Gosu::Color.new(100, 255, 255, 255)
    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @i = 0
  end

  def draw
    #@background_image.draw(0, 0, 0)
    @font1.draw("Paramètres de la partie", @pos_1, 30, 1)
      # Dessin des bouttons de changement de vaisseau
    @vaisseau1.draw(200, 150, 1, 2, 2, 0xff_ffffff, :default)
    @vaisseau2.draw(200, 400, 1, 2, 2, 0xff_ffffff, :default)
    @vaisseau3.draw(200, 650, 1, 2, 2, 0xff_ffffff, :default)
      # Image tournante du vaisseau selectionner
    @vaisseau.draw_rot(width/2, 300, 1, @i, 0.5,0.5, 2, 2, 0xff_ffffff, :default)
      # Nom du niveau selectionner
    @font3.draw(@valeur_niveau, width/2-@font3.text_width(@valeur_niveau)/2, 500, 1)
      # Nom du joueur taper au clavier
    @font3.draw(@nom, width/2-@font3.text_width(@nom)/2, 700, 1)
      # Dessin des bouttons de changement de nievau
    @font2.draw("Niveau facile", 1680-@font2.text_width("Niveau facile")/2, 200, 1)
    @font2.draw("Niveau moyen", 1680-@font2.text_width("Niveau moyen")/2, 380, 1)
    @font2.draw("Niveau difficile", 1680-@font2.text_width("Niveau difficile")/2, 560, 1)
    @font2.draw("Niveau évolutif", 1680-@font2.text_width("Niveau évolutif")/2, 740, 1)
      # Dessin des bouttons de changement de page
    @font2.draw("Retour", 480-@font2.text_width("Retour")/2, 950, 1)
    @font2.draw("Jouer", 1440-@font2.text_width("Jouer")/2, 950, 1)
      # Dessine un indicateur de bouton
    if @curseur == "vaisseau 1"
      @ligne = Gosu::draw_line(200, 150, Gosu::Color.new(0xff_ffffff), 200, 350, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(200, 350, Gosu::Color.new(0xff_ffffff), 400, 350, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(400, 350, Gosu::Color.new(0xff_ffffff), 400, 150, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(400, 150, Gosu::Color.new(0xff_ffffff), 200, 150, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 2"
      @ligne = Gosu::draw_line(200, 400, Gosu::Color.new(0xff_ffffff), 200, 600, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(200, 600, Gosu::Color.new(0xff_ffffff), 400, 600, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(400, 600, Gosu::Color.new(0xff_ffffff), 400, 400, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(400, 400, Gosu::Color.new(0xff_ffffff), 200, 400, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 3"
      @ligne = Gosu::draw_line(200, 650, Gosu::Color.new(0xff_ffffff), 200, 850, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(200, 850, Gosu::Color.new(0xff_ffffff), 400, 850, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(400, 850, Gosu::Color.new(0xff_ffffff), 400, 650, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(400, 650, Gosu::Color.new(0xff_ffffff), 200, 650, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "niveau facile"
      @carre = Gosu::draw_rect(1480, 180, 400, 100, @color)
    elsif @curseur == "niveau moyen"
      @carre = Gosu::draw_rect(1480, 360, 400, 100, @color)
    elsif @curseur == "niveau difficile"
      @carre = Gosu::draw_rect(1480, 540, 400, 100, @color)
    elsif @curseur == "niveau évolutif"
      @carre = Gosu::draw_rect(1480, 720, 400, 100, @color)
    elsif @curseur == "retour"
      @carre = Gosu::draw_rect(360, 930, 245, 100, @color)
    elsif @curseur == "jouer"
      @carre = Gosu::draw_rect(1330, 930, 220, 100, @color)
    end
  end

  def needs_cursor?
    true
  end

  # Détection de la localisation de la sourie
  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 400 && @pos_x > 200 && @pos_y < 350 && @pos_y > 150
        @vaisseau = @vaisseau1
      elsif @pos_x < 400 && @pos_x > 200 && @pos_y < 600 && @pos_y > 400
        @vaisseau = @vaisseau2
      elsif @pos_x < 400 && @pos_x > 200 && @pos_y < 850 && @pos_y > 650
        @vaisseau = @vaisseau3
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 280 && @pos_y > 180
        @valeur_niveau = "Niveau facile"
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 460 && @pos_y > 360
        @valeur_niveau = "Niveau moyen"
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 640 && @pos_y > 540
        @valeur_niveau = "Niveau difficile"
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 820 && @pos_y > 720
        @valeur_niveau = "Niveau évolutif"
      elsif @pos_x < 605 && @pos_x > 360 && @pos_y < 1030 && @pos_y > 930
        @a = "retour"
      elsif @pos_x < 1550 && @pos_x > 1330 && @pos_y < 1030 && @pos_y > 930
        @a = "jouer"
      end
    end
      # Détecte les touches du clavier pour écrire le nom du joueur
    if id == Gosu::KB_A
      @nom += "q"
    elsif id == Gosu::KB_B
      @nom += "b"
    elsif id == Gosu::KB_C
      @nom += "c"
    elsif id == Gosu::KB_D
      @nom += "d"
    elsif id == Gosu::KB_E
      @nom += "e"
    elsif id == Gosu::KB_F
      @nom += "f"
    elsif id == Gosu::KB_G
      @nom += "g"
    elsif id == Gosu::KB_H
      @nom += "h"
    elsif id == Gosu::KB_I
      @nom += "i"
    elsif id == Gosu::KB_J
      @nom += "j"
    elsif id == Gosu::KB_K
      @nom += "k"
    elsif id == Gosu::KB_L
      @nom += "l"
    elsif id == Gosu::KbSemicolon
      @nom += "m"
    elsif id == Gosu::KB_N
      @nom += "n"
    elsif id == Gosu::KB_O
      @nom += "o"
    elsif id == Gosu::KB_P
      @nom += "p"
    elsif id == Gosu::KB_Q
      @nom += "a"
    elsif id == Gosu::KB_R
      @nom += "r"
    elsif id == Gosu::KB_S
      @nom += "s"
    elsif id == Gosu::KB_T
      @nom += "t"
    elsif id == Gosu::KB_U
      @nom += "u"
    elsif id == Gosu::KB_V
      @nom += "v"
    elsif id == Gosu::KB_W
      @nom += "z"
    elsif id == Gosu::KB_X
      @nom += "x"
    elsif id == Gosu::KB_Y
      @nom += "y"
    elsif id == Gosu::KB_Z
      @nom += "w"
    elsif id == Gosu::KbSpace
      @nom += " "
    elsif id == Gosu::KbBackspace
      @nom = @nom[0...-1]
    end
  end

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    @i += 2
    if @pos_x < 400 && @pos_x > 200 && @pos_y < 350 && @pos_y > 150
      @curseur = "vaisseau 1"
    elsif @pos_x < 400 && @pos_x > 200 && @pos_y < 600 && @pos_y > 400
      @curseur = "vaisseau 2"
    elsif @pos_x < 400 && @pos_x > 200 && @pos_y < 850 && @pos_y > 650
      @curseur = "vaisseau 3"
    elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 280 && @pos_y > 180
      @curseur = "niveau facile"
    elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 460 && @pos_y > 360
      @curseur = "niveau moyen"
    elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 640 && @pos_y > 540
      @curseur = "niveau difficile"
    elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 820 && @pos_y > 720
      @curseur = "niveau évolutif"
    elsif @pos_x < 605 && @pos_x > 360 && @pos_y < 1030 && @pos_y > 930
      @curseur = "retour"
    elsif @pos_x < 1550 && @pos_x > 1330 && @pos_y < 1030 && @pos_y > 930
      @curseur = "jouer"
    else
      @curseur = "rien"
    end
  end

end