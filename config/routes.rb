Rails.application.routes.draw do
  get 'game/sum'
  get 'games/index'
  get 'sum/:text', to: 'games#index', as: :text

  root 'games#index'
end
