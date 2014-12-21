require_relative 'Cell.rb'

# Public: Various methods that are useful for performing 
# Conway's game of life
#
class World
  attr_accessor :cells, :width, :height

  # Public: Initializes the grid with all cells as dead
  #
  # width - width of the grid
  # height - height of the grid
  #
  #
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

  # Public: births a certain amount of cells based off a rough user input
  #
  # density - a density (by percentage)
  # any value above 100 will print the entire world to be populated
  #
  #
  def populate(density) 
    game_density = density
    @cells.each do |row|
      row.each do |col|
        col.toggle if rand(99) + 1 <= game_density
      end
    end
    update_neighbours
  end

  # Public: Prints the world out neatly in the command line
  #
  #
  def print_neat
    alive = 0
    dead = 0
    @cells.each do |row|
      print '|'
      row.each do |col|
        if col.alive?
          print 'X|'
          alive += 1
        else
          print ' |'
          dead += 1
        end
      end
      print "\n"
    end
    print "Amount alive is : #{alive} \n"
    print "Amount dead is : #{dead} \n"
  end

  # Public: Takes the user input about the amount of steps that you want the game
  # and prints it out
  #
  # steps - the amount of steps the game will do
  #
  #
  def play(steps)
    (0..steps).each do
      print_neat
      next_iteration
    end
  end

  private

  # Private: Updates Neighbours
  #
  #
  def update_neighbours
    (0..@width - 1).each do |x|
      (0..@height - 1).each do |y|
        @cells[x][y].set_neighbours(neighbours(x, y))
      end
    end
  end

  # Private: finds the amount of neighbours that a certain cell has
  #
  #
  def neighbours(x, y)
    neighbours = 0
    neighbours += 1 if cell_alive_and_kicking(x - 1, y)
    neighbours += 1 if cell_alive_and_kicking(x - 1, y + 1)
    neighbours += 1 if cell_alive_and_kicking(x - 1, y - 1)
    neighbours += 1 if cell_alive_and_kicking(x + 1, y)
    neighbours += 1 if cell_alive_and_kicking(x + 1, y + 1)
    neighbours += 1 if cell_alive_and_kicking(x + 1, y - 1)
    neighbours += 1 if cell_alive_and_kicking(x, y - 1)
    neighbours += 1 if cell_alive_and_kicking(x, y + 1)
    neighbours
  end

  # Private: Checks if the value is within the scope of the world,
  # and if it's alive
  #
  # x, y - coordinates of the cell
  #
  #
  def cell_alive_and_kicking(x, y)
    begin
      false if x < 0 || x > @width || y < 0 || y > @height
      return @cells[x][y].alive? if @cells[x][y].is_a?(Cell)
    rescue
      false
    end
    false
  end
  
  # Private: Produces the next generation of the world
  #
  #
  def next_iteration
    @cells.each do |row|
      row.each do |col|
        col.kill if col.neighbours < 2
        col.kill if col.neighbours > 3
        col.born if col.neighbours == 3
      end
    end
    update_neighbours
  end
end
