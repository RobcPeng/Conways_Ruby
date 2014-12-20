# Class World
require_relative 'Cell.rb'

class World
  attr_accessor :cells, :width, :height
  def initialize(width, height)
    @width = width
    @height = height
    @cells = Array.new(width) do
               Array.new(height) do
               end
             end
  end

  def start(density)
    game_density = @width * @height * (density / 100)
  end

  def next()
  end

end
