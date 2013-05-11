require './cell'

describe Cell do
  describe 'neighbours' do
    it "returns an set of neighbours position" do
      Cell.new(1,1).neighbours.should == Set.new([cell(0,0), cell(0,1), cell(0,2), cell(1,0), cell(1,2), cell(2,0), cell(2,1), cell(2,2)])
    end
  end

  def cell(x,y)
    Cell.new(x,y)
  end
end

