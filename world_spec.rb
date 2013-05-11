require './world'
require './cell'

describe World do

  describe '==' do
    specify "world with the same cells" do
      (World.new(Cell.new(0,0), Cell.new(0,1)) == World.new(Cell.new(0,0), Cell.new(0,1))).should be_true
    end
  end

  describe 'include?' do
    it "checks whether it has cell" do
      World.new(Cell.new(0,0)).include?(Cell.new(0,0)).should be_true
      World.new.include?(Cell.new(0,0)).should be_false
    end
  end
end
