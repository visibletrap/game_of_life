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
    World.new(*(judge_living_cells + revive_dead_cells))
  end

  private
  def judge_living_cells
    cells.select { |c| [2,3].include?(c.alive_neighbours_count(cells)) }
  end

  def revive_dead_cells
    cells.inject([]) { |a,c| a.concat c.neighbours.to_a }
          .group_by { |i| i }
          .select { |_,neighbours| neighbours.count == 3 }
          .map { |(c,_)| c }.flatten
  end
end
