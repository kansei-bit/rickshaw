Rails.application.routes.draw do
  root to: 'results#index'
  get 'results/index', to: "results#index"
end
