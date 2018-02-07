class Mitraillette < Arme

  def initialize()
    @type = "mitraillette"
    super( Gosu::Image.new("../Ressources/missil_2.png"), 10, 40, 20)
  end

end