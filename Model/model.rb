require 'gosu'

require_relative '../Classes/hero'
require_relative '../Classes/Ennemis/gardien'
require_relative '../Classes/Armes/canon'
require_relative '../Classes/Hitbox'

class Model

  attr_accessor :hero, :niveauDifficulte, :meilleursJoueursScore, :meilleursJoueursPseudo

  def initialize(pseudo, couleur, width, height)
    @hero = Hero.new(pseudo, couleur, width/2, height-150)
    initTableaux
  end

  def collision(hitbox1, hitbox2)
    if (hitbox1.x < hitbox2.x + hitbox2.width &&
        hitbox1.x + hitbox1.width > hitbox2.x &&
        hitbox1.y < hitbox2.y + hitbox2.height &&
        hitbox1.height + hitbox1.y > hitbox2.y)
        return true
    end
  end

  def getCadenceTirArtilleur
    @artilleur = Artilleur.new(0,0)
    return @artilleur.cadenceTir
  end

  # Init tableaux des scores
  def initTableaux
    @meilleursJoueursScore = [[],[],[]]
    for i in 1..3
      @meilleursJoueursScore.push([])
      for j in 0..4
        @meilleursJoueursScore[i][j]=0
      end
    end
    @meilleursJoueursPseudo = [[],[],[]]
    for i in 1..3
      @meilleursJoueursPseudo.push([])
      for j in 0..4
        @meilleursJoueursPseudo[i][j]=""
      end
    end
  end

  # avant fermeture
  def remplirTableaux
    trie = false
    for i in 1..3
      if @difficulte == i
        for j in 0..4
          if trie == false && @model.hero.score > @meilleursJoueursScore[i][j]
            tempPseudo = @meilleursJoueursPseudo[i][j]
            tempScore = @meilleursJoueursScore[i][j]
            @meilleursJoueursPseudo[i][j] = @model.hero.pseudo
            @meilleursJoueursScore[i][j] = @model.hero.score
            trie = true
          elsif trie == true
            tempPseudo2 = @meilleursJoueursPseudo[i][j]
            tempScore2 = @meilleursJoueursScore[i][j]
            @meilleursJoueursScore[i][j] = tempScore
            @meilleursJoueursPseudo[i][j] = tempPseudo
            tempPseudo = tempPseudo2
            tempScore = tempScore2
          end
        end
      end
    end
  end

end