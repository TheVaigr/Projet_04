class Mitraillette < Arme

  def initialize()
    @type = "mitraillette"
    super( Gosu::Image.new("../Ressources/missil_2.png"), 10, 20, 50)
  end

end