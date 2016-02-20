class Board < GameObject
  attr_accessor :width, :height, :snakes, :food, :walls, :gold

  def snakes=(snake_data)
    snake_data.map do |snake_attributes|
      Snake.new snake_attributes[:coords].shift, snake_attributes[:coords], snake_attributes[:id]
    end
  end

  def food=(food_data)
    food_data.map do |coordinants|
      FoodItem.new x_position: coordinants[0], y_postion: coordinants[1]
    end
  end

  def walls=(wall_data)
    wall_data.map do |wall_attributes|
      Wall.new x_position: coordinants[0], y_postion: coordinants[1]
    end
  end

  def gold=(gold_data)
    gold_data.map do |gold_attributes|
      GoldPiece.new Wall.new x_position: coordinants[0], y_postion: coordinants[1]
    end
  end

  def position_is_safe?(x, y)
    !position_out_of_bounds?(x, y) ||
    walls.none? { |wall| wall.same_position?(x, y) } ||
    snake.none? { |wall| wall.same_position?(x, y) }
  end

  def our_snake
    snakes.detect { |snake| snake.id == Snake::SNAKE_ID }
  end

  private

  def posiion_out_of_bounds?(x, y)
    x < 0 || y < 0 || x > width || y > height
  end
end
