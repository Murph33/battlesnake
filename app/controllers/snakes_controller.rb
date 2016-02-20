class SnakesController < ApplicationController

  def setup
    response_object = {
      color: "#fff000"
      head: 'https://www.placecage.com/20/20'
    }

    render json: response_object
  end

  def start
    board = Board.new params.keep_if { |k, v| board_params.include? k }
    response_object = {
      taunt: "BONESAW IS READY!!"
    }



    render json: response_object
  end

  def move

    our_snake_hash = params{snakes}.find { |snake| snake[:id] == Snake.SNAKE_ID }
    our_snake = Snake.new(our_snake_hash[:coords][0], our_snake_hash[:coords][1..-1])
    
    response_object = {
      move: "north",
      taunt: "we're doing it"
    }
    render json: response_object
  end

  private

  def board_params
    [:width, :height, :snakes, :food, :walls, :gold]
  end
end
