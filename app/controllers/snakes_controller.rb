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
      taunt: "BONESAW IS READY!!why no work!?"
    }

    render json: response_object
  end

  def move
    enemy_snake_params = params["snakes"].select { |snake| snake["id"] != Snake::SNAKE_ID }
    our_snake_params = params["snakes"].find { |snake| snake["id"] == Snake::SNAKE_ID }
    our_snake = Snake.new our_snake_params[:coords][0], our_snake_params[:coords][1..-1], our_snake_params[:id]
    board = Board.new
    params["walls"].each { |wall| board.walls.push wall } if params["walls"]
    params["food"].each { |food| board.food.push food } if params["food"]
    params["gold"].each { |gold| board.gold.push gold } if params["gold"]
    params["snakes"].each { |snake| snake["coords"].each { |coord| board.snakes.push coord } }
    board.height = params["height"]
    board.width = params["width"]
    enemy_snake_params.each { |params| params["coords"].each { |coord| board.snakes.push coord } }
    move = our_snake.move board

    # walls: board.walls,
    # food: board.food,
    # gold: board.gold,
    # our_snake: our_snake,
    # enemy_snake: board.snakes
    response_object = {
      move: move,
      taunt: "we're doing it2"
    }
    render json: response_object
  end

  def end

    response_object = {

    }
    render json: response_object
  end
end
