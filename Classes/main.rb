require 'gosu'

require_relative '../IHM/main_ihm'

WindowWidth = 1920
WindowHeight = 1080
Couleur = 1
Pseudo = "bla"

Window = MainIHM.new(WindowWidth, WindowHeight, Pseudo, Couleur)
Window.show