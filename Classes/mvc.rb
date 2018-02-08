require 'gosu'

class MVC < Gosu::Window


  def initialize(width, height)
    super

    @test1 = Gosu::Image.new("../ressources/ship_1_L.png")
    @image = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @vaisseau = Gosu::Image.new("../ressources/enemie_4_fighter_N.png") # Prend comme paramètre une image d'un vaisseau
    @vaisseau1 = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @vaisseau2 = Gosu::Image.new("../ressources/enemie_4_fighter_N.png")
    @vaisseau3 = Gosu::Image.new("../ressources/enemie_2_heavyfighter_N.png")

    @color = Gosu::Color.new(100, 255, 255, 255)
    @font1 = Gosu::Font.new(100)
    @font2 = Gosu::Font.new(60)
    @font3 = Gosu::Font.new(40)

    @pos_1 = (width-@font1.text_width("Milky Way Light"))/2 # Titre1
    @pos_6 = (width-@font1.text_width("Paramètres de la partie"))/2 # Titre2
    @pos_2 = (width-@font2.text_width("Jouer"))/2 # Bouton pour jouer
    @pos_3 = (width-@font2.text_width("Classement"))/2 # Bouton du classement
    @pos_4 = (width-@font2.text_width("Règles"))/2 # Bouton des regles
    @pos_5 = (width-@font2.text_width("Quitter"))/2 # Bouton pour quitter

    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie

    @valeur_niveau = "Niveau facile" # Prend comme paramètre un niveau de difficulté
    @curseur == "rien"
    @nom = ""
    @rotation = 0
    @x = 0
    @y = 0



    @selector = :pending
    @context = :acceuil
  end

  ####################################################################################################

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    case @context

      when :acceuil
        @x += 1
        @y += 1
        @rotation += 4
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
      when :menu
        @rotation += 2
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
      when :game

    end
  end

  def draw

    case @context
      when :acceuil
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
      when :menu
        updateMenu
    end
  end

  def button_up (id)
    case @context
      when :acceuil
        if id == Gosu::MS_LEFT
          if @pos_x < 1070 && @pos_x > 850 && @pos_y < 330 && @pos_y > 230
            puts "Jouer"
            @context = :menu
          elsif @pos_x < 1140 && @pos_x > 780 && @pos_y < 530 && @pos_y > 430
            puts "Classement"
          elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 730 && @pos_y > 630
            puts "Regles"
          elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 930 && @pos_y > 830
            puts "Quitter"
          end
        end
      when :menu
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
          @context = :acceuil
        elsif @pos_x < 1550 && @pos_x > 1330 && @pos_y < 1030 && @pos_y > 930
          @context = "jouer"
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
  end

  def needs_cursor?
    true
  end

  def updateMenu
    #@background_image.draw(0, 0, 0)
    @font1.draw("Paramètres de la partie", @pos_6, 30, 1)
    # Dessin des bouttons de changement de vaisseau
    @vaisseau1.draw(200, 150, 1, 2, 2, 0xff_ffffff, :default)
    @vaisseau2.draw(200, 400, 1, 2, 2, 0xff_ffffff, :default)
    @vaisseau3.draw(200, 650, 1, 2, 2, 0xff_ffffff, :default)
    # Image tournante du vaisseau selectionner
    @vaisseau.draw_rot(width/2, 300, 1, @rotation, 0.5,0.5, 2, 2, 0xff_ffffff, :default)
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
end

