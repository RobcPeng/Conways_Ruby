# Class World
require_relative 'Cell.rb'

class World
  attr_accessor :cells, :width, :height
  def initialize(width, height)
    @width = width
    @height = height
    @cells =  Array.new(height) do |col|
                Array.new(width) do |row|
                  Cell.new(row, col)  
                end
              end
    print_neat
  end

  def populate(density) #any value above 100 will print the entire graph to be true
    game_density = density
    @cells.each do |row|
      row.each do |col|
        if rand(100) > game_density
          col.toggle
        end
      end
    end
    update_neighbours
  end

  def print_neat()
    alive = 0
    dead = 0
    @cells.each do |row|
      print "|"
      row.each do |col|
        if col.alive?
          print 'X|'
          alive = alive + 1
        else
          print ' |'
          dead = dead + 1
        end
      end
      print "\n"
    end
    print "Amount alive is : #{alive} \n"
    print "Amount dead is : #{dead} \n" 
  end

  def next_iteration
    @cells.each do |row|
      row.each do |col|
        if col.neighbours < 2
          col.kill
        end
        if col.neighbours > 3
          col.kill
        end
        if col.neighbours == 3
          col.born
        end
      end
    end
    update_neighbours
  end

  def play(steps)
    for i in 0..steps
      print_neat
      next_iteration
    end
  end

  private

    def update_neighbours
    for x in 0..@width-1
      for y in 0..@height-1
        @cells[x][y].set_neighbours(neighbours(x,y))
      end
    end
  end

  def neighbours(x,y)
    neighbours = 0
    if cell_alive_and_kicking(x-1,y)
      neighbours += 1
    end
     if cell_alive_and_kicking(x-1,y+1)
      neighbours += 1
    end
     if cell_alive_and_kicking(x-1,y-1)
      neighbours += 1
    end
     if cell_alive_and_kicking(x+1,y)
      neighbours += 1
    end
     if cell_alive_and_kicking(x+1,y+1)
      neighbours += 1
    end
     if cell_alive_and_kicking(x+1,y-1)
      neighbours += 1
    end
     if cell_alive_and_kicking(x,y-1)
      neighbours += 1
    end
     if cell_alive_and_kicking(x,y+1)
      neighbours += 1
    end
    return neighbours
  end

  def cell_alive_and_kicking(x,y)
    begin
      if x < 0 or x > @width or y < 0 or y > @height
        return false
      end
      if @cells[x][y].is_a?(Cell)
        return @cells[x][y].alive?
      end
    rescue
      return false
    end
    return false
  end

end
