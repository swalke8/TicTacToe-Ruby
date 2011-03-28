require 'game'
require 'board'
require 'mock_consol'
require 'human_player'
require 'mini_max_computer'
require 'mock_human_player'
require 'game_observer'

describe Game do

	before(:each) do
		@consol = MockConsol.new
		@board = Board.new(3, @consol)
		@observer = mock("the game observer")
		@real_observer = GameObserver.new(@board)
		@real_game = Game.new(@board, @real_observer, @consol)
		@game = Game.new(@board, @observer, @consol)
	end

	it "should prompt for game option" do
		@consol.array_gets = ["2"]
		@game.set_players
		@game.player1.should be_a(HumanPlayer)
		@game.player2.should be_a(MiniMaxComputer)
	end

	it "should prompt for game option" do
		@consol.array_gets = %w(4 0 a 2)
		@game.set_players
		@game.player1.should be_a(HumanPlayer)
		@game.player2.should be_a(MiniMaxComputer)
	end

	it "should stop playing when game is over" do
		@observer.should_receive(:game_over?).and_return(true)
		@observer.should_receive(:has_winner?).and_return(false)

		@game.run_game
		@consol.string_puts.include?("Cats Game").should == true
	end

	it "should stop playing when game is over" do
		@observer.should_receive(:game_over?).and_return(true)
		@observer.should_receive(:has_winner?).and_return(true)
		@game.player_value = "Player 1"
		@game.run_game
		@consol.string_puts.include?("Player 1 wins").should == true
	end
	
	it "should play until the game is over" do
		@real_game.player1 = MockHumanPlayer.new(@board, 1)
		@real_game.player2 = MockHumanPlayer.new(@board, -1)
		@real_game.player1.moves = [0,2,4,6,8]
		@real_game.player2.moves = [1,3,5,7]
		@real_game.run_game
		@consol.string_puts.include?("Player 1 wins").should == true
	end

end
