Rails.application.routes.draw do
  resources :data_points, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "index#index"
end
