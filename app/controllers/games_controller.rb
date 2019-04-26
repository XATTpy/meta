class GamesController < ApplicationController
  def index
    @params = params
    @page = params['page'].to_i
    start = @page * 100

    if @page < 0 or @page > 112
      return redirect_to '/games/nothing'
    end
    
    if params['filter'] == 'top100'
      if params['platform'] != nil
        plat = params['platform']
        @games = Game.joins(:platform).where("platform == '#{plat}'").order(score: :desc).first(100)
      else
        @games = Game.order(score: :desc).first(100)
      end

    elsif params['filter'] == 'genre'
      genre = params['genre']
      @games = Game.joins(:genre).where("genre LIKE '%#{genre}%'").order(score: :desc).limit(100).offset(start)
    
    elsif params['text'] != nil
      text = params['text']
      @games = Game.where("title LIKE '%#{text}%'").order(score: :desc)
      if @games.size == 0
        return redirect_to '/games/nothing'
      end

    else
      @games = Game.limit(100).offset(start)
    end

  end

  def nothing
  end
  
end
