module Gol
  def self.next_gen(cells)
    next_gen_for_living_cells(cells)
  end

  def self.next_gen_for_living_cells(cells)
    Set.new cells.select { |c| [2,3].include?(c.alive_neighbours_count(cells)) }
  end
end
