Rails.application.routes.draw do
  root "movies#index"

  resources :users
  get "/sign_up" => "users#new"

  resource :session, only: [:new, :create, :destroy]
  
  resources :movies do
    resources :reviews
  end

end
