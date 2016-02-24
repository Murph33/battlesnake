# helo
class Board < GameObject
  attr_accessor :width, :height, :snakes, :food, :walls, :gold

  def initialize
    @walls = []
    @food = []
    @gold = []
    @snakes = []
  end

  def our_snake
    snakes.detect { |snake| snake.id == Snake::SNAKE_ID }
  end

  def position_is_safe?(coords)
    return false if @walls.include? coords
    return false if position_out_of_bounds? coords

  end

  private

  def position_out_of_bounds?(coords)
    coords[0] < 0 || coords[1] < 0 || coords[0] > width || coords[1] > y
  end
end
