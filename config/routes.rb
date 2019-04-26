Rails.application.routes.draw do
  get 'game/sum'
  get 'games/index'
  get 'games/nothing'

  root 'games#index'
end
