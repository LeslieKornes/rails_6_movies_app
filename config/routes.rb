Rails.application.routes.draw do
  root "movies#index"

  resources :users
  get "/sign_up" => "users#new"
  
  resources :movies do
    resources :reviews
  end

end
