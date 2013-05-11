require 'set'

Position = Struct.new(:x,:y) do
  def neighbours_pos
    Set.new([pos(x-1,y-1), pos(x-1,y), pos(x-1,y+1), pos(x,y-1), pos(x,y+1), pos(x+1,y-1), pos(x+1,y), pos(x+1,y+1)])
  end

  private

  def pos(x,y)
    Position.new(x,y)
  end
end

