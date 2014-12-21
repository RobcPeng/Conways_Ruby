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

  context 'Populating a world' do
    x = 10
    y = 10
    d = 50 # d for density
    let(:world) { World.new(x, y) }

    it 'should have no alive cells when initated' do
      alive = false
      world.cells.each do |row|
        row.each do |col|
          alive = true if col.alive?
        end
      end
      expect(alive).to be(false)
    end

    it 'should have some alive cells when populated' do
      alive = false
      world.populate(d)
      world.cells.each do |row|
        row.each do |col|
          alive = true if col.alive?
        end
      end
      expect(alive).to be(true)
    end
    it 'should have no life with a density of 0' do
      alive = false
      world.populate(0)
      world.cells.each do |row|
        row.each do |col|
          alive = true if col.alive?
        end
      end
      expect(alive).to be(false)
    end

    it 'should have everything populated with a density of 100' do
      dead = false
      world.populate(100)
      world.cells.each do |row|
        row.each do |col|
          dead = true unless col.alive?
        end
      end
      expect(dead).to be(false)
    end

    it 'should have everything populated with a density of > 100' do
      dead = false
      world.populate(101)
      world.cells.each do |row|
        row.each do |col|
          dead = true unless col.alive?
        end
      end
      expect(dead).to be(false)
    end
  end

  context 'playing the game' do
    x = 10
    y = 10
    d = 50 # d for density
    let(:world) { World.new(x, y) }

    it 'should be the same after 0 steps' do
      world.populate(d)
      zero_step = world
      zero_step.play(0)
      expect(world).to eq(zero_step)
    end
  end
end
