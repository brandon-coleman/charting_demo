Rails.application.routes.draw do
  resources :data_points, only: [:index]
  root "index#index"
end
