require_relative '../IHM/main_ihm'
require_relative '../Model/model'

WindowWidth = 1920
WindowHeight = 1080

class Controller

  attr_accessor :model

  def initialize

    @pseudo = "bla"
    @couleur = 1

    @model = Model.new(1, @pseudo, @couleur, WindowWidth, WindowHeight)

    @window = MainIHM.new(WindowWidth, WindowHeight, @model)
    Window.show
  end


end