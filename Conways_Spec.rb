require 'rspec'
require_relative 'Conways'

describe 'Conways' do
  context 'when there are less than two neighbours' do
    it 'the cell dies out of isolation' do
    end
  end

  context 'when there are two or three neighbours' do
    it 'continues living' do
    end
  end

  context 'when there are more than three neighbours' do
    it 'dies out of overcrowding' do
    end
  end

  context 'when there are exactly three live neighbours' do
    it 'a cell is born' do
    end
  end
end
