Rails.application.routes.draw do
  get 'game/sum'
  get 'games/index'

  root 'games#index'
end
