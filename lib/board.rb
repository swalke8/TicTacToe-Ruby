class Board

	attr_reader :dimension, :sum_of_rows, :sum_of_columns, :number_of_moves, :number_of_cells

	def initialize(board_size, consol)
		@game_board = Array.new(board_size*board_size) {|index| 0}
		@sum_of_rows = Array.new(board_size) {|index| 0}
		@sum_of_columns = Array.new(board_size) {|index| 0}
		@number_of_moves = 0
		@number_of_cells = @game_board.length
		@dimension = board_size
		@consol = consol
	end

	def print
		(0...number_of_cells).each do |position|
			@consol.putc "\n" if position%dimension == 0 and position != 0
			@consol.putc "["
			if empty_cell?(position)
				@consol.putc " "
			elsif value_at(position) == 1
				@consol.putc "X"
			else
				@consol.putc "O"
			end
			@consol.putc "]"
		end
	end
	
	def value_at(position)
		@game_board[position]
	end

	def empty_cell?(position)
		@game_board[position] == 0
	end

	def full?
		@number_of_moves == number_of_cells	
	end


	def set(position, player)
		@game_board[position] = player
		update_board(position, player, 1)	
	end

	def unset(position, player)
		@game_board[position] = 0
		update_board(position, player, -1)
	end

private
	
	def update_board(position, player, modifier)
		@sum_of_rows[(position/@dimension).round] += (modifier)*player
		@sum_of_columns[position% @dimension] += (modifier)*player
		@number_of_moves += modifier
	end

end
