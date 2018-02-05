require_relative 'arme'

class Canon < Arme

  def initialize
    super ((@image = Gosu::Image.new("../../resources/missil_2.png")),@vitesseTir = 100 ,@cadenceTir = 100 ,@degat = 100)
  end

end