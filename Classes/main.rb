require 'gosu'

require_relative '../Classes/MVC'
require_relative '../Model/Model'

WindowWidth = 1920
WindowHeight = 1080

@model = Model.new(WindowWidth, WindowHeight)
@MVC = MVC.new(WindowWidth,WindowHeight, @model)

@MVC.show
