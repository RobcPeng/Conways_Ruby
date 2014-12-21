#gosu gosu
require 'gosu'
require_relative 'Conways.rb'

class CGOLWindow < Gosu::Window

	def initialize
		super 640, 480, false
		self.caption = "Conway's Game of Life"
	end

	def update
	end

	def draw
	end

	def need_curser?;true;end

end

CGOLWindow.new.show
