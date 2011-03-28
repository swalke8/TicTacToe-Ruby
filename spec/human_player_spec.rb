require 'board'
require 'human_player'
require 'mock_consol'

describe HumanPlayer do

	before(:each) do
		@board = Board.new(3)
		@consol = MockConsol.new
		@player = HumanPlayer.new(@board, 1, @consol)
	end

	it "should deny invalid input and take in row value 2 and column value 3" do
		@consol.array_gets = [-1, 5, "a", 2, 3]
		@player.make_move
		@board.value_at(5).should == 1
	end

	it "should not put a piece on an occupied position" do
		@consol.array_gets = [1,1,2,3]
		@board.set(0, 1)
		@player.make_move
		@board.value_at(5).should == 1
	end

	it "should take user input and store it" do
		@consol.array_gets = [1,1,2,3]
		@consol.array_gets.length.should == 4
		@board.set(0, 1)
		@player.make_move
		@consol.array_gets.length.should == 0	
	end

	it "should ouput the proper text" do
		@consol.array_gets = [1,1,2,3]
		@board.set(0, 1)
		@player.make_move
		@consol.string_puts.should == "Enter a row value between 1-3: 1Enter a column value between 1-3: 1Please choose an empty cell! \nEnter a row value between 1-3: 2Enter a column value between 1-3: 3"
	end

end
