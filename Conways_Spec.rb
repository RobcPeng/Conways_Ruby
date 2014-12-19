require 'rspec'
require_relative 'Conways.rb'

describe 'Game of Life' do
  context 'creating a world' do
    subject { World.new }
    it 'creates a new world' do
      expect(subject.is_a?(World))
    end
    it 'should have a determined width and height' do
      expect(subject.should response_to(:width))
      expect(subject.should response_to(:heigjt))
    end
  end
end