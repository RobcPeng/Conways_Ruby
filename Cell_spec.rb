require 'rspec'
require_relative 'Cell.rb'
require_relative 'Conways.rb'

describe 'Cells' do

  context 'creating the cells' do
    x = 10 # values to create world
    y = 10

    cellx = 0
    celly = 0

    let(:world) { World.new(x, y) }
    subject { Cell.new(cellx, celly) }

    it 'creates a new cell' do
      expect(subject.is_a?(Cell))
    end

    it 'creates a cell value that is false on initalization' do
      expect(world.cells[cellx][celly].alive?).to be(false)
    end
  end
end
