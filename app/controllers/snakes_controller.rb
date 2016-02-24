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
    board = Board.new
    params["walls"].each { |wall| board.walls.push wall }
    params["food"].each { |food| board.food.push food }
    params["gold"].each { |gold| board.gold.push gold }
    our_snake = board.our_snake
    move = our_snake.want_to_move(board)

    response_object = {
      move: move,
      taunt: "we're doing it2"
    }
    render json: response_object
  end
end
