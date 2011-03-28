require 'human_player'
require 'mini_max_computer'

class Game

	attr_accessor :player1, :player2, :player_value

	def initialize(board, game_observer, consol)
		@my_board = board
		@observer = game_observer
		@consol = consol
		@player1
	 	@player2
		@player_value
	end

	def execute
		set_players
		run_game
	end

	def game_mode
		input = 0
		@consol.puts "\n\n1.Human vs. Human\n2.Human vs. Computer\n3.Computer vs. Computer"
		while input < 1 or input > 3
			@consol.print "Please select a game mode: "
			input = @consol.gets.to_i
		end
		input
	end

	def set_players
		input = game_mode
		if input == 1
			@player1 = HumanPlayer.new(@my_board, 1, @consol)
			@player2 = HumanPlayer.new(@my_board, -1, @consol)
		elsif input == 2
			@player1 = HumanPlayer.new(@my_board, 1, @consol)
			@player2 = MiniMaxComputer.new(@my_board, -1, @observer)
		else
			@player1 = MiniMaxComputer.new(@my_board, 1, @observer)
			@player2 = MiniMaxComputer.new(@my_board, -1, @observer)	
		end
	end

	def run_game
		@player_value
		@my_board.print
		while !@observer.game_over?		
			player_move			
		end

		display_winner					
	end

	def player_move
		@consol.puts "\n"	
		@player_value = "Player 1"
		@consol.puts @player_value + "'s move"
		@player1.make_move
		@my_board.print

		@consol.puts "\n"
		if !@observer.game_over?
			@player_value = "Player 2"
			@consol.puts @player_value + "'s move"
			@player2.make_move 
			@my_board.print
		end
	end

	def display_winner
		winning_message = String.new
		if !@observer.has_winner?
			winning_message = "Cats Game!"
		else
			winning_message = @player_value + " wins!"
		end

		@consol.puts winning_message	
	end

end
