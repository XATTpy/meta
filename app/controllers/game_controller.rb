class GameController < ApplicationController
  def sum
    @game = (Game.where("id = 1"))[0]
    @params = params
  end
end
