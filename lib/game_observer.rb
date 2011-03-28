class GameObserver
	
	def initialize(board)
		@my_board = board
		@total_elapsed = 0
	end

	def game_over?
		return false if (!can_game_be_over?)
		@my_board.full? || has_winner?
	end

	def has_winner?
		horizontal_or_vertical_win? || diagonal_win?
	end

private	

	def can_game_be_over?
		@my_board.number_of_moves > @my_board.dimension*2-2
	end

	def horizontal_or_vertical_win?
		(0...@my_board.dimension).each do |which_row_or_column|
			return true if horizontal_win?(which_row_or_column)
			return true if vertical_win?(which_row_or_column)
		end
		false	
	end

	def diagonal_win?
		sum_of_diagonal_right_to_left, sum_of_diagonal_left_to_right = 0, 0
		(0...@my_board.dimension).each do |position|
				sum_of_diagonal_right_to_left += @my_board.value_at(@my_board.dimension-position-1 + position*@my_board.dimension)
				sum_of_diagonal_left_to_right += @my_board.value_at(position*@my_board.dimension + position)
		end
	  
		return true if sum_of_diagonal_right_to_left.abs == @my_board.dimension || sum_of_diagonal_left_to_right.abs == @my_board.dimension
		false
	end	

	def horizontal_win?(which_row)
		@my_board.sum_of_rows[which_row].abs == @my_board.dimension
	end

	def vertical_win?(which_column)
		@my_board.sum_of_columns[which_column].abs == @my_board.dimension
	end
end
