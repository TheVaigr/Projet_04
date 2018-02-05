require 'gosu'

require_relative '../IHM/main_ihm'

WindowWidth = 1024
WindowHeight = 576
niveauDifficulte = 1
pseudo = "bla"

Window = MainIHM.new(WindowWidth, WindowHeight,niveauDifficulte, pseudo)
Window.show