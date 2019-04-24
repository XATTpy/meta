class GamesController < ApplicationController
  def index
    start = params['page'].to_i * 100
    finish = start + 100
    @games = Game.where("id > #{start} AND id <= #{finish}")
  end
end
