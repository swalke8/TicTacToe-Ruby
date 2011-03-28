require File.join(File.dirname(__FILE__), "spec_helper")
require 'board'
require 'mock_human_player'

describe MockHumanPlayer do
	before(:each) do
		@my_board = Board.new(3)
		@player = MockHumanPlayer.new(@my_board, 1)
	end

	it "should store the value 1 into cell 0" do
		@player.make_move(1,1)
		@my_board.value_at(0).should == 1
	end

	it "should store the value 1 into cell 1" do
		@player.make_move(1,2)
		@my_board.value_at(1).should == 1
	end

	it "should store the value 1 into cell 3" do
		@player.make_move(2,1)
		@my_board.value_at(3).should == 1
	end
end
