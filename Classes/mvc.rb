require 'gosu'
require_relative '../Model/model'
require_relative '../Classes/hero'
require_relative '../Classes/projectile'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/z_order'
require_relative '../Classes/Ennemis/bomber'
require_relative '../Classes/Ennemis/gardien'
require_relative '../Classes/Ennemis/ennemi'
require_relative '../Classes/Ennemis/artilleur'

class MVC < Gosu::Window

  attr_accessor :background_image, :model, :vitesseAutoScroll, :ennemis, :projectilesAllies, :projectilesEnnemis, :song, :difficulte, :width, :height, :frame, :bonus ,:couleur
  def initialize(width, height, model)
    super width, height
    @DEBUT_JEU = 100
    @FIN_JEU = 10000

    @model = model
    @difficulte = 1
    @test1 = Gosu::Image.new("../ressources/ship_1_N.png")
    @vaisseau = Gosu::Image.new("../ressources/ship_1_N.png") # Prend comme paramètre une image d'un vaisseau
    @vaisseau1 = Gosu::Image.new("../ressources/ship_1_N.png")
    @vaisseau2 = Gosu::Image.new("../ressources/ship_2_N.png")
    @vaisseau3 = Gosu::Image.new("../ressources/ship_3_N.png")
    @background_image = Gosu::Image.new("../Ressources/background.png")

    @color = Gosu::Color.new(100, 255, 255, 255)
    @font1 = Gosu::Font.new(100)
    @font2 = Gosu::Font.new(60)
    @font3 = Gosu::Font.new(40)
    @font4 = Gosu::Font.new(50)
    @font5 = Gosu::Font.new(35)
    @font6 = Gosu::Font.new(25)

    @pos_1 = (width-@font1.text_width("Milky Way Light"))/2 # Titre1
    @pos_6 = (width-@font1.text_width("Menu"))/2 # Titre2
    @pos_2 = (width-@font2.text_width("Jouer"))/2 # Bouton pour jouer
    @pos_3 = (width-@font2.text_width("Classement"))/2 # Bouton du classement
    @pos_4 = (width-@font2.text_width("Règles"))/2 # Bouton des regles
    @pos_5 = (width-@font2.text_width("Quitter"))/2 # Bouton pour quitter
    @pos_7 = (width-@font1.text_width("Classement")) / 2 # Titre
    @pos_retour = (width-@font1.text_width("Retour")) / 2 # Bouton acceuil

    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie

    @valeur_niveau = "Niveau facile" # Prend comme paramètre un niveau de difficulté
    @curseur == "rien"
    @model.hero.pseudo = ""
    @rotation = 0
    @x = 0
    @y = 0

    @vitesseAutoScroll = @difficulte * 4
    @ennemis = []
    @projectilesAllies = []
    @projectilesEnnemis = []
    @width = width
    @height = height

    @song = Gosu::Song.new("../Ressources/music/InGame.mp3")
    @song.volume = 0.0
    @song.play(true)

    @frame = 0
    @r = Random.new

    @score = 0
    @progression = 0
    @background1 = 0
    @background2 = -1080
    @bonus = []

    @context = :acceuil
  end

  ####################################################################################################

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    case @context
      when :acceuil
        updateAcceuil
      when :menu
        updateMenu
      when :classement
        updateClassement
      when :jeu
        updateJeu
    end
  end

  def draw
    case @context
      when :acceuil
        drawAcceuil
      when :menu
        drawMenu
      when :classement
        drawClassement
      when :regles
        bla
      when :jeu
        drawJeu
    end
  end

  def button_up (id)
    case @context
      when :acceuil
        button_upAcceuil(id)
      when :menu
        button_upMenu(id)
      when :classement
        button_upClassement(id)
      when :regles
        bla
      when :jeu
        button_upJeu(id)
    end
  end

  def needs_cursor?
    true
  end

  ####################################################################################################

  def drawAcceuil
    self.caption = "Acceuil"
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

  #################################################

  def drawMenu
    self.caption = "Menu"
    #@background_image.draw(0, 0, 0)
    @font1.draw("Menu", @pos_6, 30, 1)
    # Dessin des bouttons de changement de vaisseau
    @vaisseau1.draw(200, 150, 1, 2, 2, 0xff_ffffff, :default)
    @vaisseau2.draw(200, 400, 1, 2, 2, 0xff_ffffff, :default)
    @vaisseau3.draw(200, 650, 1, 2, 2, 0xff_ffffff, :default)
    # Image tournante du vaisseau selectionner
    @vaisseau.draw_rot(width/2, 300, 1, @rotation, 0.5,0.5, 2, 2, 0xff_ffffff, :default)
    # Nom du niveau selectionner
    @font3.draw(@valeur_niveau, width/2-@font3.text_width(@valeur_niveau)/2, 500, 1)
    # Nom du joueur taper au clavier
    @font3.draw(@model.hero.pseudo, width/2-@font3.text_width(@model.hero.pseudo)/2, 700, 1)
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

  #################################################

  def drawJeu
    self.caption = "Milky Way Light"
    @background_image.draw(480,@background1,-1)
    @background_image.draw(480,@background2,-1)
    for i in 0..@bonus.size-1
      if @bonus[i] != nil
        @bonus[i].draw
      end
    end
    for i in 0..@projectilesAllies.size-1
      if @projectilesAllies[i] != nil
        @projectilesAllies[i].draw
      end
    end
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        @projectilesEnnemis[i].draw
      end
    end
    if !@model.hero.estMort
      @model.hero.draw
    end
    for i in 0..(@ennemis.size-1)
      @ennemis[i].draw
    end

    @ligne = Gosu::draw_line(480, 0, Gosu::Color.new(0xff_ffffff), 480, 1080, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(1440, 0, Gosu::Color.new(0xff_ffffff), 1440, 1080, Gosu::Color.new(0xff_ffffff))



    @font5.draw(@model.hero.pseudo, 240-@font1.text_width(@model.hero.pseudo)/2, 100, 2)
    @font5.draw("Niveau :", 100, 200, 2)
    @font5.draw(@difficulte, 300, 200, 2)
    @font5.draw("Avancée :", 100, 300, 2)
    @font5.draw(@progression, 300, 300, 2)
    @font5.draw("%", 355, 300, 2)
    @font5.draw("Score :", 100, 400, 2)
    @font5.draw(@model.hero.score, 300, 400, 2)
    @font5.draw("Armes", 100, 500, 2)
  end

  #################################################

  def drawClassement
    self.caption = "Classement"
    @ligne = Gosu::draw_line(480, 310, Gosu::Color.new(0xff_ffffff), 480, 900, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(960, 310, Gosu::Color.new(0xff_ffffff), 960, 900, Gosu::Color.new(0xff_ffffff))
    @ligne = Gosu::draw_line(1440, 310, Gosu::Color.new(0xff_ffffff), 1440, 900, Gosu::Color.new(0xff_ffffff))
    @font1.draw("Classement", @pos_7, 30, 1)
    # Niveau facile
    @font2.draw("Niveau facile", 240-@font2.text_width("Niveau facile")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursPseudo[1][0], 240-@font4.text_width(@model.meilleursJoueursPseudo[1][0])/2, 360, 1)
    @font5.draw(@model.meilleursJoueursScore[1][0], 240-@font5.text_width(@model.meilleursJoueursScore[1][0])/2, 410, 1)
    @font4.draw(@model.meilleursJoueursPseudo[1][1], 240-@font4.text_width(@model.meilleursJoueursPseudo[1][1])/2, 470, 1)
    @font5.draw(@model.meilleursJoueursScore[1][1], 240-@font5.text_width(@model.meilleursJoueursScore[1][1])/2, 520, 1)
    @font4.draw(@model.meilleursJoueursPseudo[1][2], 240-@font4.text_width(@model.meilleursJoueursPseudo[1][2])/2, 580, 1)
    @font5.draw(@model.meilleursJoueursScore[1][2], 240-@font5.text_width(@model.meilleursJoueursScore[1][2])/2, 630, 1)
    @font4.draw(@model.meilleursJoueursPseudo[1][3], 240-@font4.text_width(@model.meilleursJoueursPseudo[1][3])/2, 690, 1)
    @font5.draw(@model.meilleursJoueursScore[1][3], 240-@font5.text_width(@model.meilleursJoueursScore[1][3])/2, 740, 1)
    @font4.draw(@model.meilleursJoueursPseudo[1][4], 240-@font4.text_width(@model.meilleursJoueursPseudo[1][4])/2, 800, 1)
    @font5.draw(@model.meilleursJoueursScore[1][4], 240-@font5.text_width(@model.meilleursJoueursScore[1][4])/2, 850, 1)
    # Niveau moyen
    @font2.draw("Niveau moyen", 720-@font2.text_width("Niveau moyen")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursPseudo[2][0], 720-@font4.text_width(@model.meilleursJoueursPseudo[2][0])/2, 360, 1)
    @font5.draw(@model.meilleursJoueursScore[2][0], 720-@font5.text_width(@model.meilleursJoueursScore[2][0])/2, 410, 1)
    @font4.draw(@model.meilleursJoueursPseudo[2][1], 720-@font4.text_width(@model.meilleursJoueursPseudo[2][1])/2, 470, 1)
    @font5.draw(@model.meilleursJoueursScore[2][1], 720-@font5.text_width(@model.meilleursJoueursScore[2][1])/2, 520, 1)
    @font4.draw(@model.meilleursJoueursPseudo[2][2], 720-@font4.text_width(@model.meilleursJoueursPseudo[2][2])/2, 580, 1)
    @font5.draw(@model.meilleursJoueursScore[2][2], 720-@font5.text_width(@model.meilleursJoueursScore[2][2])/2, 630, 1)
    @font4.draw(@model.meilleursJoueursPseudo[2][3], 720-@font4.text_width(@model.meilleursJoueursPseudo[2][3])/2, 690, 1)
    @font5.draw(@model.meilleursJoueursScore[2][3], 720-@font5.text_width(@model.meilleursJoueursScore[2][3])/2, 740, 1)
    @font4.draw(@model.meilleursJoueursPseudo[2][4], 720-@font4.text_width(@model.meilleursJoueursPseudo[2][4])/2, 800, 1)
    @font5.draw(@model.meilleursJoueursScore[2][4], 720-@font5.text_width(@model.meilleursJoueursScore[2][4])/2, 850, 1)
    # Niveau difficile
    @font2.draw("Niveau difficile", 1200-@font2.text_width("Niveau difficile")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursPseudo[3][0], 1200-@font4.text_width(@model.meilleursJoueursPseudo[3][0])/2, 360, 1)
    @font5.draw(@model.meilleursJoueursScore[3][0], 1200-@font5.text_width(@model.meilleursJoueursScore[3][0])/2, 410, 1)
    @font4.draw(@model.meilleursJoueursPseudo[3][1], 1200-@font4.text_width(@model.meilleursJoueursPseudo[3][1])/2, 470, 1)
    @font5.draw(@model.meilleursJoueursScore[3][1], 1200-@font5.text_width(@model.meilleursJoueursScore[3][1])/2, 520, 1)
    @font4.draw(@model.meilleursJoueursPseudo[3][2], 1200-@font4.text_width(@model.meilleursJoueursPseudo[3][2])/2, 580, 1)
    @font5.draw(@model.meilleursJoueursScore[3][2], 1200-@font5.text_width(@model.meilleursJoueursScore[3][2])/2, 630, 1)
    @font4.draw(@model.meilleursJoueursPseudo[3][3], 1200-@font4.text_width(@model.meilleursJoueursPseudo[3][3])/2, 690, 1)
    @font5.draw(@model.meilleursJoueursScore[3][3], 1200-@font5.text_width(@model.meilleursJoueursScore[3][3])/2, 740, 1)
    @font4.draw(@model.meilleursJoueursPseudo[3][4], 1200-@font4.text_width(@model.meilleursJoueursPseudo[3][4])/2, 800, 1)
    @font5.draw(@model.meilleursJoueursScore[3][4], 1200-@font5.text_width(@model.meilleursJoueursScore[3][4])/2, 850, 1)
    # Niveau évolutif
    @font2.draw("Niveau évolutif", 1680-@font2.text_width("Niveau évolutif")/2, 250, 1)
    @font4.draw(@model.meilleursJoueursPseudo[4][0], 1680-@font4.text_width(@model.meilleursJoueursPseudo[4][0])/2, 360, 1)
    @font5.draw(@model.meilleursJoueursScore[4][0], 1680-@font5.text_width(@model.meilleursJoueursScore[4][0])/2, 410, 1)
    @font4.draw(@model.meilleursJoueursPseudo[4][1], 1680-@font4.text_width(@model.meilleursJoueursPseudo[4][1])/2, 470, 1)
    @font5.draw(@model.meilleursJoueursScore[4][1], 1680-@font5.text_width(@model.meilleursJoueursScore[4][1])/2, 520, 1)
    @font4.draw(@model.meilleursJoueursPseudo[4][2], 1680-@font4.text_width(@model.meilleursJoueursPseudo[4][2])/2, 580, 1)
    @font5.draw(@model.meilleursJoueursScore[4][2], 1680-@font5.text_width(@model.meilleursJoueursScore[4][2])/2, 630, 1)
    @font4.draw(@model.meilleursJoueursPseudo[4][3], 1680-@font4.text_width(@model.meilleursJoueursPseudo[4][3])/2, 690, 1)
    @font5.draw(@model.meilleursJoueursScore[4][3], 1680-@font5.text_width(@model.meilleursJoueursScore[4][3])/2, 740, 1)
    @font4.draw(@model.meilleursJoueursPseudo[4][4], 1680-@font4.text_width(@model.meilleursJoueursPseudo[4][4])/2, 800, 1)
    @font5.draw(@model.meilleursJoueursScore[4][4], 1680-@font5.text_width(@model.meilleursJoueursScore[4][4])/2, 850, 1)
    # Bouton retour
    @font2.draw("Acceuil", 960-@font2.text_width("Acceuil")/2, 950, 1)

    if @curseur == "acceuil"
      @carre = Gosu::draw_rect(830, 930, 260, 100, @color)
    end
  end

  #################################################

  def drawRegles

  end

  ####################################################################################################

  def updateAcceuil
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
  end

  #################################################

  def updateMenu
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
  end

  #################################################

  def updateJeu
    @frame = @frame + 1
    if @progression < 100
      @progression = (@frame*100)/@FIN_JEU
    end

    @background1 += 3
    @background2 += 3
    if @background1 == 1080
      @background1 = 0
    end
    if @background2 == 0
      @background2 = -1080
    end

    # Déplacement du héro
    if (!Gosu::button_down?(Gosu::KbRight)) && (!Gosu::button_down?(Gosu::KbLeft))
      @model.hero.go_front
    elsif Gosu::button_down?(Gosu::KbRight) && @model.hero.x < @width*0.75 - @model.hero.image.width
      @model.hero.go_right
    elsif Gosu::button_down?(Gosu::KbLeft) && @model.hero.x > @width*0.25
      @model.hero.go_left
    end
    @model.hero.move

    # Deplacement des ennemis, collisions avec hero, mort de l'ennemi si hors map
    for i in 0..@ennemis.size-1
      if @ennemis[i] != nil
        @ennemis[i].seDeplacer(@difficulte)
        # Test collision entre ennemis et héro
        if @model.collision(@model.hero.hitbox,@ennemis[i].hitbox)
          @model.hero.vie -= @ennemis[i].degatCollision
          @ennemis.delete(@ennemis[i])
        elsif @ennemis[i].estDehors
          @ennemis.delete(@ennemis[i])
        end
      end
    end

    # Deplacement des bonus
    for i in 0..@bonus.size-1
      @bonus[i].seDeplace
    end

    # maj des hitbox (hero, ennemis, projectiles + déplacement)
    @model.hero.majHitbox
    for i in 0..@ennemis.size-1
      @ennemis[i].majHitbox
    end
    for i in 0..@projectilesAllies.size-1
      if @projectilesAllies[i] != nil
        @projectilesAllies[i].seDeplacer
        @projectilesAllies[i].majHitbox
      end
    end
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        @projectilesEnnemis[i].seDeplacer
        @projectilesEnnemis[i].majHitbox
      end
    end
    for i in 0..@bonus.size-1
      @bonus[i].majHitbox
    end

    # Test de collision entre ennemis et projectiles alliés
    for j in 0..@ennemis.size-1
      for i in 0..@projectilesAllies.size-1
        if @ennemis[j] != nil && @projectilesAllies[i] != nil
          if @model.collision(@projectilesAllies[i].hitbox, @ennemis[j].hitbox)
            @ennemis[j].vie = @ennemis[j].vie - @projectilesAllies[i].degat
            @projectilesAllies.delete(@projectilesAllies[i])
            if @ennemis[j].estMort
              @model.hero.score = @model.hero.score + 5
              @ennemis.delete_at(j)
            end
          end
        end
      end
    end

    # Test de collision entre hero et projectiles ennemis
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        if @model.collision(@projectilesEnnemis[i].hitbox, @model.hero.hitbox)
          @model.hero.vie = @model.hero.vie - @projectilesEnnemis[i].degat
          @projectilesEnnemis.delete(@projectilesEnnemis[i])
        end
      end
    end

    # Test de collision entre hero et bonus
    for i in 0..@bonus.size-1
      if @bonus[i] != nil
        if @model.collision(@bonus[i].hitbox, @model.hero.hitbox)
          @bonus.delete(@bonus[i])
          @model.hero.vie = @model.hero.vie + @bonus[i].soin
          if @model.hero.vie >= @model.hero.vieMax
            @model.hero.vie = @model.hero.vieMax
          end
        end
      end
    end

    # Tir du héro
    if ((@frame % @model.hero.arme.cadenceTir) == 0)
      projectiles = @model.hero.tire
      for i in 0..projectiles.size
        @projectilesAllies.push(projectiles[i])
      end

    end

    # Tir des ennemis
    for i in 0..@ennemis.size-1
      if @ennemis[i].arme != nil
        if (@frame.to_f % @model.getCadenceTirArtilleur.to_f) == 0.0
          projectiles = @ennemis[i].tire(@model.hero.x)
          for i in 0..projectiles.size
            @projectilesEnnemis.push(projectiles[i])
          end
        end
      end
    end

    # Génération des ennemis aléatoire
    postGame = 0
    if @frame > @DEBUT_JEU && (@frame % (30/@difficulte.to_f+15) == 0.0) && @frame < @FIN_JEU
      r = @r.rand(0...3)
      if r == 0
        @ennemis.push(Artilleur.new(@r.rand(@width*0.25...@width*0.75-100),0))
      elsif r == 1
        @ennemis.push(Bomber.new(@r.rand(@width*0.25...@width*0.75-100),0))
      elsif r == 2
        for i in 0..@r.rand(0...3)
          @ennemis.push(Gardien.new(@r.rand(@width*0.25...@width*0.75-100),0))
        end
      end
    end

    # Génération des bonus
    #if @r.rand(0...120) == 1
      #@bonus.push(Heal.new(@width/2,0))
    #end

    # Suppression des projectiles en dehors de la map
    for i in 0..@projectilesAllies.size-1
      if @projectilesAllies[i] != nil
        if @projectilesAllies[i].y < 0
          @projectilesAllies.delete@projectilesAllies[i]
        end
      end
    end
    for i in 0..@projectilesEnnemis.size-1
      if @projectilesEnnemis[i] != nil
        if @projectilesEnnemis[i].y > @height
          @projectilesEnnemis.delete@projectilesEnnemis[i]
        end
      end
    end

    if Gosu::button_down?(Gosu::KbEscape)
      @model.remplirTableaux(@difficulte)
      resetPartie
      @context = :acceuil
    end
  end

  #################################################

  def updateClassement
    if @pos_x < 1000 && @pos_x > 800 && @pos_y < 1030 && @pos_y > 930
      @curseur = "acceuil"
    else
      @curseur = "rien"
    end
  end

  #################################################

  def updateRegles

  end

  ####################################################################################################

  def button_upAcceuil(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 1070 && @pos_x > 850 && @pos_y < 330 && @pos_y > 230
        @context = :menu
      elsif @pos_x < 1140 && @pos_x > 780 && @pos_y < 530 && @pos_y > 430
        @context = :classement
      elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 730 && @pos_y > 630
        @context = :regles
      elsif @pos_x < 1080 && @pos_x > 840 && @pos_y < 930 && @pos_y > 830
        close
      end
    end
  end

  #################################################

  def button_upMenu(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 400 && @pos_x > 200 && @pos_y < 350 && @pos_y > 150
        @vaisseau = @vaisseau1
        @model.hero.couleur = "vert"
      elsif @pos_x < 400 && @pos_x > 200 && @pos_y < 600 && @pos_y > 400
        @vaisseau = @vaisseau2
        @model.hero.couleur = "bleu"
      elsif @pos_x < 400 && @pos_x > 200 && @pos_y < 850 && @pos_y > 650
        @vaisseau = @vaisseau3
        @model.hero.couleur = "jaune"
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 280 && @pos_y > 180
        @valeur_niveau = "Niveau facile"
        @difficulte = 1
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 460 && @pos_y > 360
        @valeur_niveau = "Niveau moyen"
        @difficulte = 2
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 640 && @pos_y > 540
        @valeur_niveau = "Niveau difficile"
        @difficulte = 3
      elsif @pos_x < 1880 && @pos_x > 1480 && @pos_y < 820 && @pos_y > 720
        @valeur_niveau = "Niveau évolutif"
        @difficulte = 4
      elsif @pos_x < 605 && @pos_x > 360 && @pos_y < 1030 && @pos_y > 930
        @context = :acceuil
      elsif @pos_x < 1550 && @pos_x > 1330 && @pos_y < 1030 && @pos_y > 930
        @context = :jeu
      end
    end
    # Détecte les touches du clavier pour écrire le nom du joueur
    if id == Gosu::KB_A
      @model.hero.pseudo += "q"
    elsif id == Gosu::KB_B
      @model.hero.pseudo += "b"
    elsif id == Gosu::KB_C
      @model.hero.pseudo += "c"
    elsif id == Gosu::KB_D
      @model.hero.pseudo += "d"
    elsif id == Gosu::KB_E
      @model.hero.pseudo += "e"
    elsif id == Gosu::KB_F
      @model.hero.pseudo += "f"
    elsif id == Gosu::KB_G
      @model.hero.pseudo += "g"
    elsif id == Gosu::KB_H
      @model.hero.pseudo += "h"
    elsif id == Gosu::KB_I
      @model.hero.pseudo += "i"
    elsif id == Gosu::KB_J
      @model.hero.pseudo += "j"
    elsif id == Gosu::KB_K
      @model.hero.pseudo += "k"
    elsif id == Gosu::KB_L
      @model.hero.pseudo += "l"
    elsif id == Gosu::KbSemicolon
      @model.hero.pseudo += "m"
    elsif id == Gosu::KB_N
      @model.hero.pseudo += "n"
    elsif id == Gosu::KB_O
      @model.hero.pseudo += "o"
    elsif id == Gosu::KB_P
      @model.hero.pseudo += "p"
    elsif id == Gosu::KB_Q
      @model.hero.pseudo += "a"
    elsif id == Gosu::KB_R
      @model.hero.pseudo += "r"
    elsif id == Gosu::KB_S
      @model.hero.pseudo += "s"
    elsif id == Gosu::KB_T
      @model.hero.pseudo += "t"
    elsif id == Gosu::KB_U
      @model.hero.pseudo += "u"
    elsif id == Gosu::KB_V
      @model.hero.pseudo += "v"
    elsif id == Gosu::KB_W
      @model.hero.pseudo += "z"
    elsif id == Gosu::KB_X
      @model.hero.pseudo += "x"
    elsif id == Gosu::KB_Y
      @model.hero.pseudo += "y"
    elsif id == Gosu::KB_Z
      @model.hero.pseudo += "w"
    elsif id == Gosu::KbSpace
      @model.hero.pseudo += " "
    elsif id == Gosu::KbBackspace
      @model.hero.pseudo -= @model.hero.pseudo[0...-1]
    end
  end

  #################################################

  def button_upJeu(id)
    if id == Gosu::KbDown
      @model.hero.changeArme
    end
  end

  #################################################

  def button_upClassement(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 1000 && @pos_x > 800 && @pos_y < 1030 && @pos_y > 930
        @context = :acceuil
      end
    end
  end

  #################################################

  def button_upRegles(id)

  end

  #################################################

  def resetPartie
    @model.hero.pseudo = ""
    @ennemis =[]
    @projectilesAllies=[]
    @projectilesEnnemis=[]
    @bonus = []
    @frame = 0
    @model.hero.vie = model.hero.vieMax
    @model.hero.score = 0
  end

end

