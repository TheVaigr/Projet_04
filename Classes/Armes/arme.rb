class Arme
attr_accessor :image, :vitesseTir, :cadenceTir, :degat, :type
  def initialize(image, vitesseTir, cadenceTir, degat)
    @vitesseTir = vitesseTir
    @cadenceTir = cadenceTir
    @degat = degat
    @image = image
  end

end