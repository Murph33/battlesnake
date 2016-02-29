class Board
  attr_accessor :width, :height, :enemy_snakes, :food, :walls, :gold, :our_snake, :north_safe, :east_safe, :west_safe, :south_safe

  def initialize(width: nil, height: nil)
    @width = width
    @height = height
    @walls = []
    @food = []
    @gold = []
    @our_snake = []
    @enemy_snakes = []
    @west_safe = []
    @south_safe = []
    @north_safe = []
    @east_safe = []
  end

  def position_is_safe?(coords)
    return false if @walls.include? coords
    return false if position_out_of_bounds? coords
    return false if @enemy_snakes.any? { |snake| snake["coords"].include? coords }
    return false if @our_snake.include? coords
    true
  end

  def generate_safe_locations(coords)
    @west_safe = []
    @south_safe = []
    @north_safe = []
    @east_safe = []
    x = coords[0]
    y = coords[1]
    generate_safe_east_locations([x + 1, y])
    generate_safe_west_locations([x - 1, y])
    generate_safe_south_locations([x, y + 1])
    generate_safe_north_locations([x, y - 1])
  end

  def enemy_head_adjacent?(coords)
    danger_areas = []
    if @enemy_snakes.any? 
      @enemy_snakes.select { |enemy_snake| enemy_snake["coords"].length >= our_snake.length }.each do |s|
        head = s["coords"][0]
        danger_areas.push [head[0] + 1, head[1]]
        danger_areas.push [head[0] - 1, head[1]]
        danger_areas.push [head[0], head[1] + 1]
        danger_areas.push [head[0], head[1] - 1]
      end
    end
    danger_areas.include? coords
  end

  def closest_food coords
    food_with_distance = @food.map do |food_coord|
      x_diff = food_coord[0] - coords[0]
      y_diff = food_coord[1] - coords[1]
      total_diff = x_diff.abs + y_diff.abs
      food_coord + [total_diff]
    end
    ordered_food = food_with_distance.sort_by { |arr| arr[2].abs }
    ordered_food[0]
  end

  private

  def generate_safe_west_locations(coords)
    return if @west_safe.length > 15
    if position_is_safe?(coords) && !(@west_safe.include?(coords))
      @west_safe.push(coords)
      generate_safe_west_locations([coords[0] + 1,coords[1]])
      generate_safe_west_locations([coords[0] - 1,coords[1]])
      generate_safe_west_locations([coords[0],coords[1] + 1])
      generate_safe_west_locations([coords[0],coords[1] - 1])
    end
  end

  def generate_safe_east_locations(coords)
    return if @east_safe.length > 15
    if position_is_safe?(coords) && !(@east_safe.include?(coords))
      @east_safe.push(coords)
      generate_safe_east_locations([coords[0] + 1,coords[1]])
      generate_safe_east_locations([coords[0] - 1,coords[1]])
      generate_safe_east_locations([coords[0],coords[1] + 1])
      generate_safe_east_locations([coords[0],coords[1] - 1])
    end
  end

  def generate_safe_south_locations(coords)
    return if @south_safe.length > 15
    if position_is_safe?(coords) && !(@south_safe.include?(coords))
      @south_safe.push(coords)
      generate_safe_south_locations([coords[0] + 1,coords[1]])
      generate_safe_south_locations([coords[0] - 1,coords[1]])
      generate_safe_south_locations([coords[0],coords[1] + 1])
      generate_safe_south_locations([coords[0],coords[1] - 1])
    end
  end

  def generate_safe_north_locations(coords)
    return if @north_safe.length > 15
    if position_is_safe?(coords) && !(@north_safe.include?(coords))
      @north_safe.push(coords)
      generate_safe_north_locations([coords[0] + 1,coords[1]])
      generate_safe_north_locations([coords[0] - 1,coords[1]])
      generate_safe_north_locations([coords[0],coords[1] + 1])
      generate_safe_north_locations([coords[0],coords[1] - 1])
    end
  end

  def position_out_of_bounds?(coords)
     coords[0] < 0 || coords[1] < 0 || coords[0] > width - 1 || coords[1] > height - 1
  end
end
