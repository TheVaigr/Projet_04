require 'gosu'

require_relative '../Classes/hero'
require_relative '../Classes/Ennemis/gardien'
require_relative '../Classes/Armes/canon'

class Model

  attr_accessor :hero, :niveauDifficulte

  def initialize(niveauDifficulte, pseudo, couleur, width, height)
    @niveauDifficulte = niveauDifficulte
    @hero = Hero.new(pseudo, arme = Canon.new(), couleur, width/2, height-100)
  end

"#{  def Collision(position1, position2)
    if position1.xa

    end
  end}"

end