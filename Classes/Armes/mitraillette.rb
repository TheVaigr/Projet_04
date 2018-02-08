class Mitraillette < Arme

  def initialize()
    @type = "mitraillette"
    super( Gosu::Image.new("../Ressources/missil_2.png"), 40, 4, 20)
  end

end