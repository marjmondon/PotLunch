Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :groups, except: [:new] do
    resources :lunches do
      resources :swaps, only: %i[index new create update]
    end
  end

  get "/dashboard", to: "swaps#index"
end
