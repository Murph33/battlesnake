class BoardObject
  attr_reader :x, :y

  def initialize(x_position, y_position)
    @x, @y = x_position, y_position
  end
end
