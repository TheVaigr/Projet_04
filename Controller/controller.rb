require_relative '../IHM/main_ihm'
require_relative '../Model/model'

WindowWidth = 1920
WindowHeight = 1080

class Controller

  attr_accessor :model

  def initialize

    @pseudo = "Filibert"
    @couleur = 1

    @model = Model.new(@pseudo, @couleur, WindowWidth, WindowHeight)
    @window = MainIHM.new(WindowWidth, WindowHeight, 1, @model)
    @window.show
  end


end