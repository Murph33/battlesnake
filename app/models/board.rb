# helo
class Board < GameObject
  attr_accessor :width, :height, :snakes, :food, :walls, :gold

  def snakes=(snake_data)
    @snakes = snake_data.map do |snake_attributes|
      Snake.new snake_attributes[:coords].shift, snake_attributes[:coords], snake_attributes[:id]
    end
  end

  def food=(food_data)
    unless food_data.nil?
      @food = food_data.map do |coordinants|
        FoodItem.new x_position: coordinants[0], y_postion: coordinants[1]
      end
    end
  end

  def walls=(wall_data)
    unless wall_data.nil?
      @walls = wall_data.map do |coordinants|
        Wall.new x_position: coordinants[0], y_postion: coordinants[1]
      end
    end
  end

  def gold=(gold_data)
    unless gold_data.nil?
      @gold = gold_data.map do |coordinants|
        GoldPiece.new x_position: coordinants[0], y_postion: coordinants[1]
      end
    end
  end

  def position_is_safe?(x, y)
    return false if position_out_of_bounds?(x, y)
    unless walls.nil?
      return false unless walls.none? { |wall| wall.same_position?(x, y) }
    end
    unless snakes.nil?
      return false unless snake.none? { |snake| snake.same_position?(x, y) }
    end
    true
  end

  def our_snake
    snakes.detect { |snake| snake.id == Snake::SNAKE_ID }
  end

  private

  def position_out_of_bounds?(x, y)
    x < 0 || y < 0 || x > width || y > height
  end
end
