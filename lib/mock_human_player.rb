require 'board'

class MockHumanPlayer
		
		attr_accessor :moves

	def initialize(board, player_value)
		@my_board = board
		@me = player_value
		@moves
	end

	def make_move			
		@my_board.set(@moves.shift, @me)	
	end
		
end

