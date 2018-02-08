require_relative 'arme'

class Mitraillette < Arme

  def initialize()
    @type = "mitraillette"
    super(Gosu::Image.new("../Ressources/tire_vert.png"), 40, 4, 20)
  end

end