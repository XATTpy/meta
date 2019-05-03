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
        @games = Game.joins(:platform).where("platform = '#{plat}'").order(score: :desc).first(100)
      else
        @games = Game.order(score: :desc).first(100)
      end

    elsif params['filter'] == 'genre'
      genre = params['genre']
      @games = Game.joins(:genre).where("genre ILIKE '%#{genre}%'").order(score: :desc).limit(100).offset(start)
    
    elsif params['text'] != nil
      text = params['text']
      if text == ''
        return redirect_to '/'
      end      
      @games = Game.where("title ILIKE '%#{text}%'").order(score: :desc)
      if @games.size == 0
        return redirect_to '/games/nothing'
      end

    else
      @games = Game.limit(100).offset(start)
    end

  end

  def nothing
    if params['text'] != nil
      return redirect_to "/?text=#{params['text']}"
    end
  end
  
end
