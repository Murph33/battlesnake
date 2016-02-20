class Snake

  SNAKE_ID = "5d936817-6c91-4708-99c9-c7e77f61fcf7"

  attr_reader :head, :body

  def initialize(head= nil, body= nil, id = nil)
    @head = head
    @body = body
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
    y_distance_from_center = (board.height) / 2 - @head[0]
    x_distance_from_center = (board.width) / 2 - @head[1]
  end

  def same_position?(x, y)
    [head, body].flatten(1).any? do |coordinants|
      coordinants[0] == x && coordinants[1] == y
    end
  end
end
