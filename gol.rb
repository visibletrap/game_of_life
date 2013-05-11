module Gol
  def self.next_gen(cells)
    calculate_for_living_cells(cells)
  end

  def self.calculate_for_living_cells(cells)
    new_cells = Set.new
    cells.each do |c|
      if [2,3].include?(c.alive_neighbours_count(cells))
        new_cells << c
      end
    end
    new_cells
  end
end
