module Gol
  def self.next_gen(world)
    cells = world.cells
    World.new(*(next_gen_for_living_cells(cells) + next_gen_for_dead_cells(cells)))
  end

  def self.next_gen_for_living_cells(cells)
    cells.select { |c| [2,3].include?(c.alive_neighbours_count(cells)) }
  end

  def self.next_gen_for_dead_cells(cells)
    cells.inject([]) { |a,c| a.concat c.neighbours.to_a }.group_by { |i| i }.select { |_,v| v.count == 3 }.map { |c| c.first }.flatten
  end
end
