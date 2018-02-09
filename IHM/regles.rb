class Regles < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Détails du jeu"

    @vaisseau_ennemi_1 = Gosu::Image.new("../ressources/enemie_2_fighter_N.png")
    @vaisseau_ennemi_2 = Gosu::Image.new("../ressources/enemie_2_heavyfighter_N.png")
    @vaisseau_ennemi_3 = Gosu::Image.new("../ressources/enemie_3_blocker_N.png")
    @vaisseau_ennemi_4 = Gosu::Image.new("../ressources/enemie_4_fighter_N.png")
    @vaisseau_ennemi_5 = Gosu::Image.new("../ressources/enemie_5_mamout_N.png")
    @vaisseau_allie = Gosu::Image.new("../ressources/ship_1_N.png")
    @bonus_heal = Gosu::Image.new("../ressources/popup_life.png")
    @bonus_shield = Gosu::Image.new("../ressources/ship_3_N.png")
    @arme1 = Gosu::Image.new("../ressources/tire_vert.png")
    @arme2 = Gosu::Image.new("../ressources/missil_2.png")
    @arme3 = Gosu::Image.new("../ressources/missil_4.png")
    @image = "rien"
    @font1 = Gosu::Font.new(100)
    @font2 = Gosu::Font.new(60)
    @font3 = Gosu::Font.new(40)
    @font7 = Gosu::Font.new(30)
    @pos_8 = (width-@font1.text_width("Détails du jeu")) / 2 # Titre
    @pos_retour = (width-@font1.text_width("Retour")) / 2
    @curseur = "rien"
    @clic = false
    @color = Gosu::Color.new(100, 255, 255, 255)
    @pos_x = mouse_x # Position verticale de la sourie
    @pos_y = mouse_y # Position horizontal de la sourie
    @rotation = 0
    @x1 = 0
    @x2 = 0
    @y1 = 0
    @y2 = 0
    @color1 = Gosu::Color.new(0xff_0fffff)
    @color2 = Gosu::Color.new(0xff_f0ffff)
    @color3 = Gosu::Color.new(0xff_ff0fff)
    @color4 = Gosu::Color.new(0xff_fff0ff)
    @color_trait_1 = 0
    @color_trait_2 = 0
    @color_trait_3 = 0
    @color_trait_4= 0
  end

  def update
    @pos_x = mouse_x
    @pos_y = mouse_y
    @rotation += 1
    if @rotation%20 == 0
      @color_trait_1 = @color1
      @color_trait_2 = @color2
      @color_trait_3 = @color3
      @color_trait_4 = @color4
    elsif @rotation%20 == 5
      @color_trait_1 = @color4
      @color_trait_2 = @color1
      @color_trait_3 = @color2
      @color_trait_4 = @color3
    elsif @rotation%20 == 10
      @color_trait_1 = @color3
      @color_trait_2 = @color4
      @color_trait_3 = @color1
      @color_trait_4 = @color2
    elsif @rotation%20 == 15
      @color_trait_1 = @color2
      @color_trait_2 = @color3
      @color_trait_3 = @color4
      @color_trait_4 = @color1
    end
    if @pos_x < 245 && @pos_x > 95 && @pos_y < 550 && @pos_y > 400
      @curseur = "vaisseau 1"
    elsif @pos_x < 435 && @pos_x > 285 && @pos_y < 550 && @pos_y > 400
      @curseur = "vaisseau 2"
    elsif @pos_x < 245 && @pos_x > 95 && @pos_y < 700 && @pos_y > 550
      @curseur = "vaisseau 3"
    elsif @pos_x < 435 && @pos_x > 285 && @pos_y < 700 && @pos_y > 550
      @curseur = "vaisseau 4"
    elsif @pos_x < 435 && @pos_x > 95 && @pos_y < 900 && @pos_y > 700
      @curseur = "vaisseau 5"
    elsif @pos_x < 1605 && @pos_x > 1455 && @pos_y < 550 && @pos_y > 400
      @curseur = "vaisseau"
    elsif @pos_x < 1805 && @pos_x > 1655 && @pos_y < 550 && @pos_y > 400
      @curseur = "shield"
    elsif @pos_x < 1605 && @pos_x > 1455 && @pos_y < 700 && @pos_y > 550
      @curseur = "heal"
    elsif @pos_x < 1805 && @pos_x > 1655 && @pos_y < 700 && @pos_y > 550
      @curseur = "arme1"
    elsif @pos_x < 1605 && @pos_x > 1455 && @pos_y < 850 && @pos_y > 700
      @curseur = "arme2"
    elsif @pos_x < 1805 && @pos_x > 1655 && @pos_y < 850 && @pos_y > 700
      @curseur = "arme3"
    elsif @pos_x < 1095 && @pos_x > 840 && @pos_y < 1030 && @pos_y > 930
      @curseur = "acceuil"
    else
      @curseur = "rien"
    end
  end

  def draw
    @font1.draw("Détails du jeu", @pos_8, 30, 1)

    @vaisseau_ennemi_1.draw(95, 400, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @vaisseau_ennemi_2.draw(285, 400, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @vaisseau_ennemi_3.draw(95, 550, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @vaisseau_ennemi_4.draw(285, 550, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @vaisseau_ennemi_5.draw(-75, 620, 0, 1.5, 1.5, 0xff_ffffff, :default)
    @vaisseau_allie.draw(1455, 400, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @bonus_heal.draw(1668, 400, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @bonus_shield.draw(1455, 550, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @arme1.draw(1618, 600, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @arme2.draw(1455, 700, 1, 1.5, 1.5, 0xff_ffffff, :default)
    @arme3.draw(1618, 750, 1, 1.5, 1.5, 0xff_ffffff, :default)

      # Dessin des bouttons de changement d'objet
    if @curseur == "vaisseau 1"
      @ligne = Gosu::draw_line(95, 400, Gosu::Color.new(0xff_ffffff), 245, 400, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(245, 400, Gosu::Color.new(0xff_ffffff), 245, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(245, 550, Gosu::Color.new(0xff_ffffff), 95, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(95, 550, Gosu::Color.new(0xff_ffffff), 95, 400, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 2"
      @ligne = Gosu::draw_line(285, 400, Gosu::Color.new(0xff_ffffff), 435, 400, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(435, 400, Gosu::Color.new(0xff_ffffff), 435, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(435, 550, Gosu::Color.new(0xff_ffffff), 285, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(285, 550, Gosu::Color.new(0xff_ffffff), 285, 400, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 3"
      @ligne = Gosu::draw_line(95, 550, Gosu::Color.new(0xff_ffffff), 245, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(245, 550, Gosu::Color.new(0xff_ffffff), 245, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(245, 700, Gosu::Color.new(0xff_ffffff), 95, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(95, 700, Gosu::Color.new(0xff_ffffff), 95, 550, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 4"
      @ligne = Gosu::draw_line(285, 550, Gosu::Color.new(0xff_ffffff), 435, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(435, 550, Gosu::Color.new(0xff_ffffff), 435, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(435, 700, Gosu::Color.new(0xff_ffffff), 285, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(285, 700, Gosu::Color.new(0xff_ffffff), 285, 550, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau 5"
      @ligne = Gosu::draw_line(95, 700, Gosu::Color.new(0xff_ffffff), 435, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(435, 700, Gosu::Color.new(0xff_ffffff), 435, 900, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(435, 900, Gosu::Color.new(0xff_ffffff), 95, 900, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(95, 900, Gosu::Color.new(0xff_ffffff), 95, 700, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "vaisseau"
      @ligne = Gosu::draw_line(1455, 400, Gosu::Color.new(0xff_ffffff), 1605, 400, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1605, 400, Gosu::Color.new(0xff_ffffff), 1605, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1605, 550, Gosu::Color.new(0xff_ffffff), 1455, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1455, 550, Gosu::Color.new(0xff_ffffff), 1455, 400, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "shield"
      @ligne = Gosu::draw_line(1655, 400, Gosu::Color.new(0xff_ffffff), 1805, 400, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1805, 400, Gosu::Color.new(0xff_ffffff), 1805, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1805, 550, Gosu::Color.new(0xff_ffffff), 1655, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1655, 550, Gosu::Color.new(0xff_ffffff), 1655, 400, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "heal"
      @ligne = Gosu::draw_line(1455, 550, Gosu::Color.new(0xff_ffffff), 1605, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1605, 550, Gosu::Color.new(0xff_ffffff), 1605, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1605, 700, Gosu::Color.new(0xff_ffffff), 1455, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1455, 700, Gosu::Color.new(0xff_ffffff), 1455, 550, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "arme1"
      @ligne = Gosu::draw_line(1655, 550, Gosu::Color.new(0xff_ffffff), 1805, 550, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1805, 550, Gosu::Color.new(0xff_ffffff), 1805, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1805, 700, Gosu::Color.new(0xff_ffffff), 1655, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1655, 700, Gosu::Color.new(0xff_ffffff), 1655, 550, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "arme2"
      @ligne = Gosu::draw_line(1455, 700, Gosu::Color.new(0xff_ffffff), 1605, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1605, 700, Gosu::Color.new(0xff_ffffff), 1605, 850, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1605, 850, Gosu::Color.new(0xff_ffffff), 1455, 850, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1455, 850, Gosu::Color.new(0xff_ffffff), 1455, 700, Gosu::Color.new(0xff_ffffff))
    elsif @curseur == "arme3"
      @ligne = Gosu::draw_line(1655, 700, Gosu::Color.new(0xff_ffffff), 1805, 700, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1805, 700, Gosu::Color.new(0xff_ffffff), 1805, 850, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1805, 850, Gosu::Color.new(0xff_ffffff), 1655, 850, Gosu::Color.new(0xff_ffffff))
      @ligne = Gosu::draw_line(1655, 850, Gosu::Color.new(0xff_ffffff), 1655, 700, Gosu::Color.new(0xff_ffffff))
    end

    if @clic == true
      @ligne = Gosu::draw_line(@x1, @y1, @color_trait_1, @x2, @y1, @color_trait_2)
      @ligne = Gosu::draw_line(@x2, @y1, @color_trait_2, @x2, @y2, @color_trait_3)
      @ligne = Gosu::draw_line(@x2, @y2, @color_trait_3, @x1, @y2, @color_trait_4)
      @ligne = Gosu::draw_line(@x1, @y2, @color_trait_4, @x1, @y1, @color_trait_1)
    end

      # Donnée de l'objet selectionner
    if @image == @vaisseau_ennemi_5
      @image.draw(width/2-350, 320, 1, 1.5, 1.5, 0xff_ffffff, :default)
      @font7.draw("Le gardin se deplace normalement et vous bloquer le passage",(width-@font7.text_width("Le gardin se deplace normalement et vous bloquer le passage"))/ 2, 600, 1)
      @font7.draw("PV : 800" ,(width-@font7.text_width("PV : 100"))/ 2, 650, 1)
      @font7.draw("Vitesse : normal" ,(width-@font7.text_width("Vitesse : normal"))/ 2, 700, 1)
      @font7.draw("Dégats de collision : 40" ,(width-@font7.text_width("Dégats de collision : 40"))/ 2, 750, 1)
      @font7.draw("Dégats de tir : 0" ,(width-@font7.text_width("Dégats de tir : 0"))/ 2, 800, 1)
    elsif @image == "rien"
    else
      @image.draw_rot(width/2, 500, 1, @rotation, 0.5,0.5, 2, 2, 0xff_ffffff, :default)
      if @image == @vaisseau_ennemi_1
        @font7.draw("L'artilleur se deplace doucement et tire sur votre position",(width-@font7.text_width("L'artilleur se deplace doucement et tire sur votre position"))/ 2, 600, 1)
        @font7.draw("PV : 100" ,(width-@font7.text_width("PV : 100"))/ 2, 650, 1)
        @font7.draw("Vitesse : lent" ,(width-@font7.text_width("Vitesse : lent"))/ 2, 700, 1)
        @font7.draw("Dégats de collision : 20" ,(width-@font7.text_width("Dégats de collision : 50"))/ 2, 750, 1)
        @font7.draw("Dégats de tir : 20" ,(width-@font7.text_width("Dégats de tir : 30"))/ 2, 800, 1)
      elsif @image == @vaisseau_ennemi_2
        @font7.draw("Pas encore implémenter",(width-@font7.text_width("Pas encore implémenter"))/ 2, 600, 1)
        @font7.draw("Only DLC",(width-@font7.text_width("Only DLC"))/ 2, 650, 1)
      elsif @image == @vaisseau_ennemi_3
        @font7.draw("Pas encore implémenter",(width-@font7.text_width("Pas encore implémenter"))/ 2, 600, 1)
        @font7.draw("Only DLC",(width-@font7.text_width("Only DLC"))/ 2, 650, 1)
      elsif @image == @vaisseau_ennemi_4
        @font7.draw("Le bomber se deplace vite et agit comme un kamikaze",(width-@font7.text_width("Le bomber se deplace vite et agit comme un kamikaze"))/ 2, 600, 1)
        @font7.draw("PV : 150" ,(width-@font7.text_width("PV : 150"))/ 2, 650, 1)
        @font7.draw("Vitesse : rapide" ,(width-@font7.text_width("Vitesse : rapide"))/ 2, 700, 1)
        @font7.draw("Dégats de collision : 30" ,(width-@font7.text_width("Dégats de collision : 30"))/ 2, 750, 1)
        @font7.draw("Dégats de tir : 0" ,(width-@font7.text_width("Dégats de tir : 0"))/ 2, 800, 1)
      elsif @image == @vaisseau
        @font7.draw("Votre vaisseau",(width-@font7.text_width("Votre vaisseau"))/ 2, 600, 1)
        @font7.draw("PV : 100" ,(width-@font7.text_width("PV : 100"))/ 2, 650, 1)
      elsif @image == @bonus_shield
        @font7.draw("Bouclier",(width-@font7.text_width("Bouclier"))/ 2, 600, 1)
        @font7.draw("Pas encore implémenter",(width-@font7.text_width("Pas encore implémenter"))/ 2, 650, 1)
      elsif @image == @bonus_heal
        @font7.draw("Un paquet de soin qui vous rend de la vie",(width-@font7.text_width("Un paquet de soin qui vous rend de la vie"))/ 2, 600, 1)
        @font7.draw("Soin : 100",(width-@font7.text_width("Soin : 100"))/ 2, 650, 1)
      elsif @image == @arme1
        @font7.draw("Un tir de blaster avec une fréquence élever",(width-@font7.text_width("Un tir de blaster avec une fréquence élever"))/ 2, 600, 1)
        @font7.draw("mais de faible dégats",(width-@font7.text_width("mais de faible dégtas"))/ 2, 650, 1)
      elsif @image == @arme2
        @font7.draw("Une roquette avec une fréquence de tir moyen",(width-@font7.text_width("Une roquette avec une fréquence de tir moyen"))/ 2, 600, 1)
        @font7.draw("avec des dégats moyen",(width-@font7.text_width("avec des dégats moyen"))/ 2, 650, 1)
      elsif @image == @arme3
        @font7.draw("Un missile avec une basse fréquence de tir qui se",(width-@font7.text_width("Un missile avec une basse fréquence de tir qui se"))/ 2, 600, 1)
        @font7.draw("déplace doucement, mais annihile tous ce qu'il touche",(width-@font7.text_width("déplace doucement, mais annihile tous ce qu'il touche"))/ 2, 650, 1)
      end
    end

      # Texte
    @font2.draw("Acceuil",(width-@font2.text_width("Retour"))/ 2, 950, 1)
    @font7.draw("Dans ce jeu, vous affronterez l'infini de l'espace,toute fois celui-ci est remplis d'ennemis de", (width-@font7.text_width("Dans ce jeu, vous affronterez l'infini de l'espace,toute fois celui-ci est remplis d'ennemis de"))/ 2, 150, 1)
    @font7.draw("toutes sortes, vous devrez soient les détruir a l'aide de vos differentes armes soient les éviter", (width-@font7.text_width("toutes sortes, vous devrez soient les détruir a l'aide de vos differentes armes soient les éviter"))/ 2, 200, 1)
    @font7.draw("car toutes collision endomageraient votre vaisseau, et si votre vaisseau devient trop endomager, vous", (width-@font7.text_width("car toutes collision endomageraient votre vaisseau, et si votre vaisseau devient trop endomager, vous"))/ 2, 250, 1)
    @font7.draw("sucomberer. Des bonus apparaiteront pour vous aider dans votre périple.", (width-@font7.text_width("sucomberer. Des bonus apparaiteront pour vous aider dans votre périple."))/ 2, 300, 1)

    @ligne = Gosu::draw_line(560, 400, @color_trait_1, 1360, 400, @color_trait_2)
    @ligne = Gosu::draw_line(1360, 400, @color_trait_2, 1360, 900, @color_trait_3)
    @ligne = Gosu::draw_line(1360, 900, @color_trait_3, 560, 900, @color_trait_4)
    @ligne = Gosu::draw_line(560, 900, @color_trait_4, 560, 400, @color_trait_1)

    if @curseur == "acceuil"
      @carre = Gosu::draw_rect(840, 930, 255, 100, @color)
    end
  end

  def needs_cursor?
    true
  end

  def button_up(id)
    if id == Gosu::MS_LEFT
      if @pos_x < 245 && @pos_x > 95 && @pos_y < 550 && @pos_y > 400
        @clic = true
        @image = @vaisseau_ennemi_1
        @x1 = 95
        @x2 = 245
        @y1 = 400
        @y2 = 550
      elsif @pos_x < 435 && @pos_x > 285 && @pos_y < 550 && @pos_y > 400
        @clic = true
        @image = @vaisseau_ennemi_2
        @x1 = 285
        @x2 = 435
        @y1 = 400
        @y2 = 550
      elsif @pos_x < 245 && @pos_x > 95 && @pos_y < 700 && @pos_y > 550
        @clic = true
        @image = @vaisseau_ennemi_3
        @x1 = 95
        @x2 = 245
        @y1 = 550
        @y2 = 700
      elsif @pos_x < 435 && @pos_x > 285 && @pos_y < 700 && @pos_y > 550
        @clic = true
        @image = @vaisseau_ennemi_4
        @x1 = 285
        @x2 = 435
        @y1 = 550
        @y2 = 700
      elsif @pos_x < 435 && @pos_x > 95 && @pos_y < 900 && @pos_y > 700
        @clic = true
        @image = @vaisseau_ennemi_5
        @x1 = 95
        @x2 = 435
        @y1 = 700
        @y2 = 900
      elsif @pos_x < 1605 && @pos_x > 1455 && @pos_y < 550 && @pos_y > 400
        @clic = true
        @image = @vaisseau_allie
        @x1 = 1455
        @x2 = 1605
        @y1 = 400
        @y2 = 550
      elsif @pos_x < 1805 && @pos_x > 1655 && @pos_y < 550 && @pos_y > 400
        @clic = true
        @image = @bonus_shield
        @x1 = 1655
        @x2 = 1805
        @y1 = 400
        @y2 = 550
      elsif @pos_x < 1605 && @pos_x > 1455 && @pos_y < 700 && @pos_y > 550
        @clic = true
        @image = @bonus_heal
        @x1 = 1455
        @x2 = 1605
        @y1 = 550
        @y2 = 700
      elsif @pos_x < 1805 && @pos_x > 1655 && @pos_y < 700 && @pos_y > 550
        @clic = true
        @image = @arme1
        @x1 = 1655
        @x2 = 1805
        @y1 = 550
        @y2 = 700
      elsif @pos_x < 1605 && @pos_x > 1455 && @pos_y < 850 && @pos_y > 700
        @clic = true
        @image = @arme2
        @x1 = 1455
        @x2 = 1605
        @y1 = 700
        @y2 = 850
      elsif @pos_x < 1805 && @pos_x > 1655 && @pos_y < 850 && @pos_y > 700
        @clic = true
        @image = @arme3
        @x1 = 1655
        @x2 = 1805
        @y1 = 700
        @y2 = 850
      elsif @pos_x < 1095 && @pos_x > 840 && @pos_y < 1030 && @pos_y > 930
        puts "acceuil"
      end
    end
  end

end