# helo
class Board < GameObject
  attr_accessor :width, :height, :snakes, :food, :walls, :gold

  def initialize
    @walls = []
    @food = []
    @gold = []
  end

  def our_snake
    snakes.detect { |snake| snake.id == Snake::SNAKE_ID }
  end

  private

  def position_out_of_bounds?(x, y)
    x < 0 || y < 0 || x > width || y > height
  end
end
