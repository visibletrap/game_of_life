require './cell'
require './gol'

describe Gol do
  describe 'next_gen' do
    describe 'a live cell' do
      it 'dies with 0 live neighbour' do
        Gol.next_gen(Set.new([cell(0,0)])).should == Set.new
      end

      it 'stay alive with 2 live neighbours' do
        Gol.next_gen(Set.new([cell(0,-1),cell(0,0),cell(0,1)])).should == Set.new([cell(0,0)])
      end

      it 'stays alive with 3 live neighbours' do
        Gol.next_gen(Set.new([cell(-1,-1),cell(-1,1),cell(0,0),cell(1,1)])).should == Set.new([cell(0,0)])
      end

      it 'dies with 4 live neighbours' do
        Gol.next_gen(Set.new([cell(-1,-1), cell(-1,1), cell(0,0), cell(1,-1), cell(1,1)])).should == Set.new
      end
    end

    describe 'a dead cell', pending: true do
      it "becomes alive with 3 neighbours" do
        Gol.next_gen(Set.new([cell(-1,-1), cell(-1,1), cell(1,1)])).should == Set.new([cell(0,0)])
      end
    end

    def cell(x,y)
      Cell.new(x,y)
    end
  end
end
