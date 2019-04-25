class GameController < ApplicationController
  def sum
    id = params['id']
    @game = (@game = Game.where("id == #{id}"))[0]
  end
end
