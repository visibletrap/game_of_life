module Gol
  def self.next_gen(world)
    new_world = Set.new
    world.each do |c|
      if [2,3].include?(c.neighbours.select { |p| world.include?(p) }.count)
        new_world << c
      end
    end
    new_world
  end
end
