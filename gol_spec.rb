require 'minitest/autorun'

module Gol
  def self.next_gen(world)
    {}
  end
end

Position = Struct.new(:x,:y)

class LiveCell 
end

describe Gol do
  describe 'next_gen' do
    describe 'a live cell with 0 live neighbour' do
      it 'dies' do
        assert_equal Gol.next_gen({ Position.new(0,0) => LiveCell.new }), {}
      end
    end
  end
end
