require 'gosu'

require_relative '../IHM/main_ihm'

WindowWidth = 1024
WindowHeight = 576
Couleur = 1
Pseudo = "bla"

Window = MainIHM.new(WindowWidth, WindowHeight, Pseudo, Couleur)
Window.show