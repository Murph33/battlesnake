class SnakesController < ApplicationController

  def setup
    response_object = {
      color: "#fff000"
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
    response_object = {
      move: "north",
      taunt: "we're doing it"
    }

    render json: response_object
  end
end
