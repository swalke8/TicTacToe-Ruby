require File.join(File.dirname(__FILE__), "spec_helper")
require 'board'
require 'game_observer'

describe GameObserver do
	
	before(:each) do
		@my_board = Board.new(3)
		@observer = GameObserver.new(@my_board)
	end

	it "should return false when there is not a horizontal win" do
		@my_board.set(0,1)
		@my_board.set(1,1)

		@observer.game_over?.should == false	
	end


	it "should return true when there is a horizontal win" do
		@my_board.set(0,1)
		@my_board.set(1,1)
		@my_board.set(2,1)

		@my_board.set(3,-1)
		@my_board.set(4,-1)

		@observer.game_over?.should == true	
	end

	it "should return true when there is a horizontal win" do
		@my_board.set(3,1)
		@my_board.set(4,1)
		@my_board.set(5,1)

		@my_board.set(0, -1)
		@my_board.set(1,-1)

		@observer.game_over?.should == true	
	end

	it "should return true when there is a horizontal win" do
		@my_board.set(6,1)
		@my_board.set(7,1)
		@my_board.set(8,1)
		
		@my_board.set(0,-1)
		@my_board.set(1,-1)
		@observer.game_over?.should == true	
	end

	it "should return false when there is not a vertical win" do
		@my_board.set(0,1)
		@my_board.set(3,1)

		@observer.game_over?.should == false	
	end


	it "should return true when there is a vertical win" do
		@my_board.set(0,1)
		@my_board.set(3,1)
		@my_board.set(6,1)

		@my_board.set(2,-1)
		@my_board.set(1,-1)
		@observer.game_over?.should == true	
	end

	it "should return true when there is a vertical win" do
		@my_board.set(1,1)
		@my_board.set(4,1)
		@my_board.set(7,1)

		@my_board.set(0,-1)
		@my_board.set(3,-1)
		@observer.game_over?.should == true	
	end

	it "should return true when there is a vertical win" do
		@my_board.set(2,1)
		@my_board.set(5,1)
		@my_board.set(8,1)

		@my_board.set(0,-1)
		@my_board.set(1,-1)

		@observer.game_over?.should == true	
	end

	it "should return false when there is no diagonal left to right win" do
		@my_board.set(0,1)
		@my_board.set(4,1)

		@observer.game_over?.should == false
	end

	it "should return true when there is a diagonal left to right win" do
		@my_board.set(0,1)
		@my_board.set(4,1)
		@my_board.set(8,1)

		@my_board.set(2,-1)
		@my_board.set(1,-1)
		@observer.game_over?.should == true
	end

	it "should return true when there is a diagonal right to left win" do
		@my_board.set(2,1)
		@my_board.set(4,1)
		@my_board.set(6,1)

		@my_board.set(0,-1)
		@my_board.set(1,-1)
		@observer.game_over?.should == true
	end

	it "should return true when the board is full" do
		(0...@my_board.number_of_cells).each do |position|
			@my_board.set(position, 2)
		end
		@observer.game_over?.should == true
	end

end
