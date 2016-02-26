# helo
class Board < GameObject
  attr_accessor :width, :height, :snakes, :food, :walls, :gold

  def initialize(width: nil, height: nil)
    @width = width
    @height = height
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
    return false if @snakes.include? coords
    true
  end

  def closest_food coords
    food_with_distance = @food.map do |food_coord|
      x_diff = food_coord[0] - coords[0]
      y_diff = food_coord[1] - coords[1]
      total_diff = x_diff + y_diff
      food_coord + [total_diff]
    end
    food_with_distance.sort_by { |arr| arr[2].abs }[0]
  end

  private

  def position_out_of_bounds?(coords)
     coords[0] < 0 || coords[1] < 0 || coords[0] > width || coords[1] > height
  end
end
