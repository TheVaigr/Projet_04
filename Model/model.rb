require 'gosu'

require_relative '../Classes/hero'

class Model

  attr_accessor :hero, :niveauDifficulte

  def initialize(niveauDifficulte, pseudo, couleur, width, height)
    @niveauDifficulte = niveauDifficulte
    @hero = Hero.new(pseudo, arme = Canon.new(), couleur, width/2, height/2)
  end


end