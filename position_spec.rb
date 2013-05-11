
describe Position do
  describe 'neighbours_pos' do
    it "returns an set of neighbours position" do
      Position.new(1,1).neighbours_pos.should == Set.new([pos(0,0), pos(0,1), pos(0,2), pos(1,0), pos(1,2), pos(2,0), pos(2,1), pos(2,2)])
    end
  end

  def pos(x,y)
    Position.new(x,y)
  end
end

