require './cell'

describe Cell do
  describe 'neighbours' do
    it "returns an set of neighbours position" do
      cell(1,1).neighbours.should =~ 
        [cell(0,0), cell(0,1), cell(0,2), cell(1,0), cell(1,2), cell(2,0), cell(2,1), cell(2,2)]
    end
  end

  describe 'alive_neighbours_count' do
    specify "0 alive neighbour" do
      c = cell(0,0)
      c.alive_neighbours_count(World.new(c)).should == 0
    end
    
    specify "8 alive neighbours" do
      c = cell(1,1)
      world = World.new(c, cell(0,0), cell(0,1), cell(0,2), cell(1,0), cell(1,2), cell(2,0), cell(2,1), cell(2,2))
      c.alive_neighbours_count(world).should == 8
    end
  end

  def cell(x,y)
    Cell.new(x,y)
  end
end

