class Mitraillette < Arme

  def initialize()
    @type = "mitraillette"
    super( Gosu::Image.new("../Ressources/missil_2.png"), 100, 100, 100)
  end

end