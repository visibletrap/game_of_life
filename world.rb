require 'forwardable'

class World
  extend Forwardable

  attr_reader :cells

  def_delegators :cells, :include?

  def initialize(*cells)
    @cells = Set.new(cells)
  end

  def ==(other_world)
    self.cells == other_world.cells
  end

  def next_gen
    World.new(*(retain_2_or_3_neighbours_living_neighbours_cells + revive_3_neighbours_dead_cells))
  end

  private
  def retain_2_or_3_neighbours_living_neighbours_cells
    cells.select { |c| [2,3].include?(c.alive_neighbours_count(self)) }
  end

  def revive_3_neighbours_dead_cells
    cells.inject([]) { |a,c| a.concat c.neighbours }
          .group_by { |i| i }
          .select { |_,neighbours| neighbours.count == 3 }
          .map { |(c,_)| c }.flatten
  end
end
