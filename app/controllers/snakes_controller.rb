class SnakesController < ApplicationController

  def setup
    response_object = {
      color: "#fff000",
      head: 'https://www.placecage.com/20/20'
    }

    render json: response_object
  end

  def start
    response_object = {
      taunt: "BONESAW IS READY!!"
    }

    render json: response_object
  end

  def move
    # binding.pry
    # board = Board.new params.keep_if { |k, v| board_params.include? k }
    # # board = Board.new params
    #
    # our_snake_hash = params["snakes"].find { |snake| snake[:id] == Snake::SNAKE_ID }
    # 
    # snake = Snake.new(our_snake_hash[:coords][0], our_snake_hash[:coords][1..-1])

    # our_snake = board.our_snake
    # move = our_snake.want_to_move(board)

    response_object = {
      move: "west",
      taunt: "we're doing it"
    }
    render json: response_object
  end

  private

  def board_params
    %w(width height snakes food walls gold)
  end
end
