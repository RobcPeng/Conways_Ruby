require 'rspec'
require_relative 'Conways.rb'

describe 'Game of Life' do
  context 'creating a world' do
    x = 0 # values to create world
    y = 0

    subject { World.new(x, y) }

    it 'creates a new world' do
      expect(subject.is_a?(World))
    end

    it 'should have a determined width and height' do
      expect(subject.width).to equal(x)
      expect(subject.height).to equal(y)
    end

    it 'should have a grid' do
      expect(subject).to respond_to(:cells)
      expect(subject.cells.is_a?(Array))
      subject.cells.each do |arr|
        expect(arr.is_a?(Array))
      end
    end
  end
end
