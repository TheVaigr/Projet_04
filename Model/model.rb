require 'gosu'

require_relative '../Classes/hero'
require_relative '../Classes/Ennemis/gardien'

class Model

  attr_accessor :hero, :niveauDifficulte, :vitesseAutoScroll, :ennemis

  def initialize(niveauDifficulte, pseudo, couleur, width, height)
    @niveauDifficulte = niveauDifficulte
    @hero = Hero.new(pseudo, arme = Canon.new(), couleur, width/2, height-100)
    @vitesseAutoScroll = @niveauDifficulte * 1.25
    @ennemis = []
    @ennemis[0] = Gardien.new(900,50)
  end


end