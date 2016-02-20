class Snake

  SNAKE_ID = "5d936817-6c91-4708-99c9-c7e77f61fcf7"

  attr_reader :head, :body, :south_tried, :north_tried, :west_tried, :east_tried

  def initialize(head= nil, body= nil)
    @head = head
    @body = body
    @south_tried = false
    @north_tried = false
    @west_tried = false
    @east_tried = false
  end

  def attempted_move direction
    y_position = @head[0]
    x_position = @head[1]
    case direction
    when "N"
      new_y_position = y_position - 1
      new_x_position = x_position
      [new_y_position, new_x_position]
    when "S"
      new_y_position = y_position + 1
      new_x_position = x_position
      [new_y_position, new_x_position]
    when "E"
      new_y_position = y_position
      new_x_position = x_position + 1
      [new_y_position, new_x_position]
    when "W"
      new_y_position = y_position
      new_x_position = x_position - 1
      [new_y_position, new_x_position]
    end
  end

  def want_to_move board
    y_midpoint = board.height / 2
    x_midpoint = board.width / 2
    y_distance_from_center = (board.height) / 2 - @head[0]
    x_distance_from_center = (board.width) / 2 - @head[1]

    if y_distance_from_center > x_distance_from_center
      if (y_midpoint > @head[0] && !@south_tried)
        @south_tried = true
        move = "S"
        coordinates = self.attempted_move(move)
        if board.position_is_safe?(coordinates)
          "south"
        else
          self.want_to_move board
        end
      elsif !@north_tried
        @north_tried = true
        move = "N"
        coordinates = self.attempted_move(move)
        if board.position_is_safe?(coordinates)
          "north"
        else
          self.want_to_move board
        end
      end
    else
      if x_midpoint > @head[1] && !@west_tried
        @west_tried = true
        move = "W"
        coordinates = self.attempted_move(move)
        if board.position_is_safe?(coordinates)
          "west"
        else
          self.want_to_move board
        end
      elsif !@east_tried
        @east_tried = true
        move = "E"
        coordinates = self.attempted_move(move)
        if board.position_is_safe?(coordinates)
          "east"
        else
          self.want_to_move board
        end
      end
    end
  end
end
