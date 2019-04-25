class GameController < ApplicationController
  def sum
    if params['text'] != nil
      return redirect_to "/?text=#{params['text']}"
    end
    id = params['id']
    @game = (@game = Game.where("id == #{id}"))[0]
  end
end
