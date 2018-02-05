class Acceuil < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Acceuil"
    #@background_image = Gosu::Image.new("../resources/test.jpg")
    @font1 = Gosu::Font.new(70)
    @font2 = Gosu::Font.new(self, "Arial", 40)
    @pos_1 = (width-@font1.text_width("Nom du jeu")) / 2
    @pos_2 = (width-@font2.text_width("Jouer")) / 2

  end

  COLORS = {
      red: Gosu::Color.new(255, 255, 0, 0),
      blue: Gosu::Color.new(0, 0, 255),
      white: Gosu::Color.new(0xff_ffffff)
  }

  def draw
    #@background_image.draw(0, 0, 0)
    @font1.draw("Nom du jeu", @pos_1, 70, 0)
    @font2.draw("Jouer", @pos_2, 200, 0)
    @font2.draw("Classement", @pos_2 - 30, 300, 0)
    @font2.draw("Règles", @pos_2, 400, 0)
    @font2.draw("Quitter", @pos_2, 500, 0)
  end

  def needs_cursor?
    true
  end



  def update
    if button_down?(Gosu::MS_LEFT) # Détection bouton gauche souris enfoncé
      puts "Et tu cliques, cliques, cliques"
    end
  end


end