Rails.application.routes.draw do
  get 'games/index'

  root 'games#index'
end
