require 'minitest/autorun'
require 'set'

module Gol
  def self.next_gen(world)
    new_world = {}
    world.each do |pos, c|
      if 2 == pos.neighbours_pos.select { |p| world.include?(p) }.count
        new_world[pos] = c
      end
    end
    new_world
  end
end

Position = Struct.new(:x,:y) do
  def neighbours_pos
    Set.new([pos(x-1,y-1), pos(x-1,y), pos(x-1,y+1), pos(x,y-1), pos(x,y+1), pos(x+1,y-1), pos(x+1,y), pos(x+1,y+1)])
  end

  private

  def pos(x,y)
    Position.new(x,y)
  end
end

describe Position do
  describe 'neighbours_pos' do
    it "returns an set of neighbours position" do
      assert_equal Position.new(1,1).neighbours_pos, Set.new([pos(0,0), pos(0,1), pos(0,2), pos(1,0), pos(1,2), pos(2,0), pos(2,1), pos(2,2)])
    end
  end

  def pos(x,y)
    Position.new(x,y)
  end
end

class LiveCell 
  def ==(cell)
    cell.instance_of?(LiveCell)
  end
end

describe Gol do
  describe 'next_gen' do
    specify 'a live cell with 0 live neighbour dies' do
      assert_equal Gol.next_gen({ Position.new(0,0) => LiveCell.new }), {}
    end

    specify 'a live cell with 2 live neighbour stays alive' do
      assert_equal Gol.next_gen({ 
        Position.new(0,-1) => LiveCell.new,
        Position.new(0,0)  => LiveCell.new, 
        Position.new(0,1)  => LiveCell.new, 
      }), {
        Position.new(0,0)  => LiveCell.new 
      }
    end
  end
end
