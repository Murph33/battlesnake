class BoardObject < GameObject
  attr_reader :x_position, :y_postion

  def same_position?(x, y)
    x_position == x && y_postion == y
  end
end
