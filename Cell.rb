require_relative 'Conways'

class Cell
  attr_accessor :x, :y, :alive
  def initialize(x, y)
    @x = x
    @y = y
    @alive = false
    @neighbours = 0
  end

  def set_neighbours(neighbours)
    @neighbours = neighbours
  end

  def neighbours
    @neighbours
  end

	def alive?
    @alive
  end

  def toggle
    @alive = !@alive
  end

  def kill
    @alive = false
  end

  def born
    @alive = true
  end

end
