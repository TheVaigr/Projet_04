require 'gosu'

require_relative '../IHM/main_ihm'

WindowWidth = 1900
WindowHeight = 1000
Couleur = 1
Pseudo = "bla"

Window = MainIHM.new(WindowWidth, WindowHeight, Pseudo, Couleur)
Window.show