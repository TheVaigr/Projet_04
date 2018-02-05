require 'gosu'

require_relative '../*'

class Model

  def initialize(width, height, niveauDifficulte, pseudo)
    @niveauDifficulte = niveauDifficulte
    @hero = Hero.new(pseudo, armeBase, width/2, height/2)
  end


end