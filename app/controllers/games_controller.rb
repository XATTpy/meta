class GamesController < ApplicationController
  def index
    @page = params['page'].to_i
    start = @page * 100
    finish = start + 100
    @games = Game.where("id > #{start} AND id <= #{finish}")
  end
end
