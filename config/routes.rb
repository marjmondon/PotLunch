Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :groups, except: [:new] do
    resources :lunches do
      resources :swaps, only: %i[new create update]
    end
  end
  resources :swaps, only: %i[index update]
  # get "/dashboard", to: "swaps#index"
end
