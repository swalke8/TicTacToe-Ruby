class MiniMaxComputer

	def initialize(board, player_value, observer)
		@my_board = board
		@observer = observer
		@me = player_value
		@position
	end

	def make_move
		return 0 if @observer.game_over?
		if first_or_second_move?
			set_predefined_position
		else
			perform_mini_max(@me, 0, 0)
		end
		@my_board.set(@position, @me)
	end

private

	def perform_mini_max(player_value, best_path_score, iteration)
		counter = 0
		(0...@my_board.number_of_cells).each do |position|
			path_score = 0
			if @my_board.empty_cell?(position)
				@my_board.set(position, player_value)

				if !@observer.game_over?
					path_score += perform_mini_max(-player_value, best_path_score, iteration+1)
				else
					if @observer.has_winner?
						path_score += player_value/@me 						
						return path_score if immediate_win?(iteration, position)
					end
				end	
				
				best_path_score = update_best_path_score(player_value, path_score, best_path_score,	iteration, counter, position)
				counter+=1
				@my_board.unset(position,player_value)
			end
		end
		best_path_score
	end

	def first_or_second_move?
		@my_board.number_of_moves == 0 or @my_board.number_of_moves == 1
	end

	def set_predefined_position
		if !@my_board.empty_cell?(0) or !@my_board.empty_cell?(@my_board.dimension-1) or !@my_board.empty_cell?(@my_board.number_of_cells - @my_board.dimension - 1) or !@my_board.empty_cell?(@my_board.number_of_cells-1)
			@position = @my_board.number_of_cells/2 
		else
			@position = 0
		end
	end

	def immediate_win?(iteration, position)
		if iteration == 0
			@position = position
			return true
		end
		false
	end

	def update_best_path_score(player_value, path_score, best_path_score, iteration, counter, position)
		if counter == 0 or (path_score > best_path_score and player_value == @me) or (path_score < best_path_score and player_value == -@me)
			best_path_score = path_score
			@position = position if iteration == 0
		end
		best_path_score	
	end
end
