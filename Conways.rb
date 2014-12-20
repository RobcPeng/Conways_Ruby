# Class World
require_relative 'Cell.rb'

class World
  attr_accessor :cells, :width, :height
  def initialize(width, height)
    @width = width
    @height = height
    @cells =  Array.new(width) do |row|
                Array.new(height) do |col|
                  Cell.new(self, row, col)  
                end
              end
  end

  def populate(density)
    game_density = (@width * @height * density) * 0.01
    @cells.each do |row|
      row.each do |col|
        if rand(100) < game_density
          col.toggle
        end
      end
    end

    # for iterater in 0..game_density
    #   x = rand(@width) #turn a random amount of cells to alive
    #   y = rand(@height)
    #   print x
    #   print y
    #   @cells[x][y].toggle
    # end
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
          print 'O|'
          dead = dead + 1
        end
      end
      print "\n"
    end
    print "Amount alive is : #{alive} \n"
    print "Amount dead is : #{dead}" 
  end

  def next()
  end

end
