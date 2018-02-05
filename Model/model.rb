require 'gosu'

require_relative '../Classes/hero'

class Model

  attr_accessor :hero, :niveauDifficulte, :vitesseAutoScroll

  def initialize(niveauDifficulte, pseudo, couleur, width, height)
    @niveauDifficulte = niveauDifficulte
    @hero = Hero.new(pseudo, arme = Canon.new(), couleur, width/2, height-100)
    @vitesseAutoScroll = @niveauDifficulte * 1.25
  end


end