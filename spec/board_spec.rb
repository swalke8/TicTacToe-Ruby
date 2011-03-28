require File.join(File.dirname(__FILE__), "spec_helper")
require 'board'

describe Board do

	before(:each) do
		@my_board = Board.new(3)
	end

	it "should set position 0 to have a value of 1" do
		@my_board.set(0,1)
		@my_board.value_at(0).should == 1
	end

	it "should return false when the position is occupied" do
		@my_board.set(0,1)
		@my_board.empty_cell?(0).should == false
	end

	it "should return true when the position is not occupied" do
		@my_board.empty_cell?(0).should == true
	end

	it "should return true when the board is full" do
		(0...@my_board.number_of_cells).each do |position|
			@my_board.set(position, 1)
		end

		@my_board.full?.should == true
	end

end
