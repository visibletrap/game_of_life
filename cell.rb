require 'set'

Cell = Struct.new(:x,:y) do
  def neighbours
    Set.new([cell(x-1,y-1), cell(x-1,y), cell(x-1,y+1), cell(x,y-1), cell(x,y+1), cell(x+1,y-1), cell(x+1,y), cell(x+1,y+1)])
  end

  private

  def cell(x,y)
    Cell.new(x,y)
  end
end

