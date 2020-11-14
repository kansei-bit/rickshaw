Rails.application.routes.draw do
  devise_for :shafus
  root to: 'results#index'
  get 'results/index', to: "results#index"
  resources :receipts, only: :new
end
