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
end
