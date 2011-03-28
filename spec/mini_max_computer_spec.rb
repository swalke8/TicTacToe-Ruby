require File.join(File.dirname(__FILE__), "spec_helper")
require 'board'
require 'mini_max_computer'
require 'benchmark'

describe MiniMaxComputer do
	
	before(:each) do
		@my_board = Board.new(3)
		@observer = GameObserver.new(@my_board)
		@computer = MiniMaxComputer.new(@my_board, 1, @observer)
		@computer2 = MiniMaxComputer.new(@my_board, -1, @observer)
	end

	it "should be a corner move for the first move" do
		@computer.make_move
		@my_board.value_at(0).should == 1
	end

	it "should take a center piece for the second move" do
		@computer.make_move
		@computer2.make_move
		@my_board.value_at(4).should == -1
	end

	it "should end in a cats game" do
#Benchmark.bm do |x|
#x.report {@computer.make_move}
#end
			while !@observer.game_over?
				@computer.make_move
				@computer2.make_move
				@computer.make_move
				@computer2.make_move
				@computer.make_move
				@computer2.make_move
				@computer.make_move
				@computer2.make_move
				@computer.make_move
			end
			@observer.has_winner?.should == false
	end
end
