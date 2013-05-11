require './position'

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

class LiveCell 
  def ==(cell)
    cell.instance_of?(LiveCell)
  end
end

describe Gol do
  describe 'next_gen' do
    specify 'a live cell with 0 live neighbour dies' do
      Gol.next_gen({ Position.new(0,0) => LiveCell.new }).should == {}
    end

    specify 'a live cell with 2 live neighbour stays alive' do
      Gol.next_gen({ 
        Position.new(0,-1) => LiveCell.new,
        Position.new(0,0)  => LiveCell.new, 
        Position.new(0,1)  => LiveCell.new, 
      }).should == {
        Position.new(0,0)  => LiveCell.new 
      }
    end
  end
end
