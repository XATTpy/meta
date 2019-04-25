class GamesController < ApplicationController
  def index
    @page = params['page'].to_i
    start = @page * 100
    finish = start + 100
    if params['filter'] == 'top100'
      if params['platform'] != nil
        plat = params['platform']
        @games = Game.joins(:platform).where("platform == '#{plat}'").order(score: :desc).first(100)
      else
        @games = Game.order(score: :desc).first(100)
      end
    else
      @games = Game.where("id > #{start} AND id <= #{finish}")
    end
  end
end
