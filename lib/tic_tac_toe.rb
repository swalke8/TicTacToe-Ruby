require 'game'
require 'board'
require 'game_observer'
require 'real_consol'

consol = RealConsol.new
board = Board.new(3, consol)
observer = GameObserver.new(board)

game = Game.new(board, observer, consol)
game.execute
