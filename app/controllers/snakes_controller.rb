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
      taunt: "BONESAW IS READY!!5"
    }

    render json: response_object
  end

  def move
    board = Board.new params.keep_if { |k, v| board_params.include? k }
    our_snake = board.our_snake
    move = our_snake.want_to_move(board)

    response_object = {
      move: move,
      taunt: "we're doing it2"
    }
    render json: response_object
  end

  private

  def board_params
    %w(width height snakes food walls gold)
  end
end
