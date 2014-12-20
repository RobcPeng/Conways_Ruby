require_relative 'Conways'

class Cell
  attr_accessor :x, :y, :world

  def initialize(world, x, y)
    @x = x
    @y = y
    @alive = false
  end

	def alive?
    @alive
  end

  def toggle
    @alive = !@alive
  end

  def neighbours
    neighbours = []
    #find cell neighbours
  end

end
