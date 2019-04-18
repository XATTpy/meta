Rails.application.routes.draw do
  get 'games/index'

  root 'game#index'
end
