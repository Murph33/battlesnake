class Board
  attr_reader :width, :height, :snakes, :food, :walls, :gold

  def initialize(width: nil, height: nil, snakes: nil, food: nil, walls: nil, gold: nil)
    @width, @height, @snakes, @food, @walls, @gold =
      width, height, snakes, food, walls, gold
  end
end
