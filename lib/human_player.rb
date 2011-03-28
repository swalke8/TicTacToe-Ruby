require 'mock_consol'
class HumanPlayer
	
	def initialize(board, player_value, consol)
		@my_board = board
		@me = player_value
		@board_dimension = @my_board.dimension
		@position
		@consol = consol
	end

	def make_move
		loop do
			player_move
			break if position_valid?
		end
		@my_board.set(@position, @me)
	end

private

	def player_move
		row = prompt_for_row_or_column("row")
		column = prompt_for_row_or_column("column")
		calculate_position(row, column)
	end

	def prompt_for_row_or_column(row_or_column)
		input = -1
		loop do
			@consol.print "Enter a " << row_or_column << " value between 1-#{@board_dimension.round}: "
			input = @consol.gets
			@consol.puts input.to_s if @consol.is_a?(MockConsol)
			break if valid_row_or_column?(input.to_i)
		end
		input.to_i
	end

	def calculate_position(row, column)
		@position = (row-1)*@board_dimension + (column-1)
	end

	def valid_row_or_column?(input_value)
		input_value > 0 and input_value <= @board_dimension
	end

	def position_valid?	
		if position_is_occupied?
			display_errors
			return false
		end
		true
	end

	def position_is_occupied?
		!@my_board.empty_cell?(@position)
	end
	
	def display_errors
		@consol.print "Please choose an empty cell! \n" if position_is_occupied?
	end
end
