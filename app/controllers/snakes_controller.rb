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
      taunt: "BONESAW IS READY!"
    }

    render json: response_object
  end

  def move
    enemy_snake_params = params["snakes"].select { |snake| snake["id"] != Snake::SNAKE_ID }
    our_snake_params = params["snakes"].find { |snake| snake["id"] == Snake::SNAKE_ID }
    our_snake = Snake.new our_snake_params[:coords][0], our_snake_params[:coords][1..-1], our_snake_params[:id], our_snake_params[:health]
    board = Board.new
    board.height = params["height"]
    board.width = params["width"]
    params["walls"].each { |wall| board.walls.push wall } if params["walls"]
    params["food"].each { |food| board.food.push food } if params["food"]
    params["gold"].each { |gold| board.gold.push gold } if params["gold"]
    enemy_snake_params.each { |snake| board.enemy_snakes.push snake }
    our_snake_params["coords"].each { |coord| board.our_snake.push coord }
    move = our_snake.move board
    taunt = [our_snake.preferred_direction, our_snake.unpreferred_direction]

    response_object = {
      move: move,
      taunt: taunt
    }
    render json: response_object
  end

  def end
    response_object = {}
    render json: response_object
  end
end
