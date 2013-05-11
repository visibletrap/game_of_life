require './world'
require './cell'

describe World do

  describe '==' do
    specify "world with the same cells" do
      (World.new(cell(0,0), cell(0,1)) == World.new(cell(0,0), cell(0,1))).should be_true
    end
  end

  describe 'include?' do
    it "checks whether it has cell" do
      World.new(cell(0,0)).include?(cell(0,0)).should be_true
      World.new.include?(cell(0,0)).should be_false
    end
  end

  describe 'next_gen' do
    describe 'a live cell' do
      it 'dies with 0 live neighbour' do
        World.new(cell(0,0)).next_gen.should == World.new
      end

      it 'stay alive with 2 live neighbours' do
        World.new(cell(0,-1),cell(0,0),cell(0,1)).next_gen.should include(cell(0,0))
      end

      it 'stays alive with 3 live neighbours' do
        World.new(cell(-1,-1),cell(-1,1),cell(0,0),cell(1,1)).next_gen.should include(cell(0,0))
      end

      it 'dies with 4 live neighbours' do
        World.new(cell(-1,-1), cell(-1,1), cell(0,0), cell(1,-1), cell(1,1)).next_gen.should_not include(cell(0,0))
      end
    end

    describe 'a dead cell' do
      it "becomes alive with 3 neighbours" do
        World.new(cell(-1,-1), cell(-1,1), cell(1,1)).next_gen.should include(cell(0,0))
      end
    end
  end

  def cell(x,y)
    Cell.new(x,y)
  end
end
