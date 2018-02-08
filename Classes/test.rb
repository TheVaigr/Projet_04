require 'gosu'

require_relative '../IHM/Acceuil'
require_relative '../IHM/Choix_lvl'
require_relative '../IHM/Test'
require_relative '../IHM/Classement'
require_relative '../Classes/MVC'
require_relative '../Model/Model'



WindowWidth = 1920
WindowHeight = 1080

#@Acceuil1 = Acceuil.new(WindowWidth, WindowHeight)
#@Acceuil1.show

#@Choix1 = Choix_lvl.new(WindowWidth, WindowHeight)
#@Choix1.show

@couleur = 1
@model = Model.new(@couleur, WindowWidth, WindowHeight)
#@Test = Test.new(WindowWidth, WindowHeight, @model)
#@Test.show

#@Classement = Classement.new(WindowWidth, WindowHeight)
#@Classement.show

@MVC = MVC.new(WindowWidth,WindowHeight, @model)
@MVC.show
