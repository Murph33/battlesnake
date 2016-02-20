class Board < GameObject
  attr_accessor :width, :height, :snakes, :food, :walls, :gold

  def snakes=(snake_data)
    snake_data.map do |snake_attributes|
      Snake.new snake_attributes
    end
  end

  def food=(food_data)
    food_data.map do |food_attributes|
      FoodItem.new food_attributes
    end
  end

  def walls=(wall_data)
    wall_data.map do |wall_attributes|
      Wall.new wall_attributes
    end
  end

  def gold=(gold_data)
    gold_data.map do |gold_attributes|
      GoldPiece.new gold_attributes
    end
  end

  def position_is_safe?(x, y)
    position_out_of_bounds?(x, y) ||
    walls.any? { |wall| wall.same_position?(x, y) } ||
    snake.any { |wall| wall.same_position?(x, y) }
  end

  private

  def posiion_out_of_bounds?(x, y)
    x < 0 || y < 0 || x > width || y > height
  end
end
