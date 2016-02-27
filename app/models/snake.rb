# hello there
class Snake
  SNAKE_ID = "5d936817-6c91-4708-99c9-c7e77f61fcf7"

  attr_reader :id, :head, :body, :health, :south_tried, :north_tried, :west_tried, :east_tried, :unpreferred_direction_head, :unpreferred_direction, :preferred_direction

  def initialize(head = nil, body = nil, id=nil, health=nil)
    @head = head
    @body = body
    @id = id
    @health = health
    @south_tried = false
    @north_tried = false
    @west_tried = false
    @east_tried = false
    @preferred_direction = []
    @unpreferred_direction = []
    @unpreferred_direction_head = []
  end



  def attempted_move direction
    y_position = @head[1]
    x_position = @head[0]
    case direction
    when "N"
      new_y_position = y_position - 1
      new_x_position = x_position
      [new_x_position, new_y_position]
    when "S"
      new_y_position = y_position + 1
      new_x_position = x_position
      [new_x_position, new_y_position]
    when "E"
      new_y_position = y_position
      new_x_position = x_position + 1
      [new_x_position, new_y_position]
    when "W"
      new_y_position = y_position
      new_x_position = x_position - 1
      [new_x_position, new_y_position]
    end
  end

  def move(board)
    # coords = [board.width / 2, board.height / 2]
    # desired_direction_order(coords).select { |direction| self.send "#{direction}_safe?", board }[0]
    desired_direction_order(priorities(board)).each { |direction| self.send "#{direction}_safe?", board }
    return @preferred_direction[0] if @preferred_direction.any?
    return @unpreferred_direction[0] if @unpreferred_direction.any?
    return @unpreferred_direction_head[0] if @unpreferred_direction_head.any?
  end


  def same_position?(x, y)
    [[head], body].flatten(1).any? do |coordinants|
      coordinants[0] == x && coordinants[1] == y
    end
  end


  def south_safe? board
    @south_tried = true
    coordinates = self.attempted_move("S")
    @unpreferred_direction_head.push('south') if board.enemy_head_adjacent?(coordinates)
    if board.position_is_safe?(coordinates)
      if board.south_safe.length < 10
        @unpreferred_direction.push('south')
      else
        @preferred_direction.push('south')
      end
    end
  end

  def west_safe? board
    @west_tried = true
    coordinates = self.attempted_move("W")
    @unpreferred_direction_head.push('west') if board.enemy_head_adjacent?(coordinates)
    if board.position_is_safe?(coordinates)
      if board.west_safe.length < 10
        @unpreferred_direction.push('west')
      else
        @preferred_direction.push('west')
      end
    end
  end

  def east_safe? board
    @east_tried = true
    coordinates = self.attempted_move("E")
    @unpreferred_direction_head.push('east') if board.enemy_head_adjacent?(coordinates)
    if board.position_is_safe?(coordinates)
      if board.east_safe.length < 10
        @unpreferred_direction.push('east')
      else
        @preferred_direction.push('east')
      end
    end
  end

  def north_safe? board
    @north_tried = true
    coordinates = self.attempted_move("N")
    @unpreferred_direction_head.push('north') if board.enemy_head_adjacent?(coordinates)
    if board.position_is_safe?(coordinates)
      if board.north_safe.length < 10
        @unpreferred_direction.push('north')
      else
        @preferred_direction.push('north')
      end
    end
  end

  def priorities board
    return board.gold.first if board.gold.any?
    return board.closest_food(@head) if health <= 97
    [board.width / 2, board.height / 2]
  end

  def desired_direction_order coords
    order = []
    y_desired = coords[1]
    x_desired = coords[0]

    order.push "west" if @head[0] > x_desired
    order.push "east" if @head[0] < x_desired
    order.push "north" if @head[1] > y_desired
    order.push "south" if @head[1] < y_desired
    # order.shuffle!
    add_these = %w(north east south west).select { |word| !order.include? word }
    add_these.each { |word| order.push word }
    order
  end

  # case direction
  # when "north"
  #   return "north" if north_safe? board
  # when "west"
  #   return "west" if west_safe? board
  # when "east"
  #   return "east" if east_safe? board
  # when "south"
  #   return "south" if south_safe? board


end
