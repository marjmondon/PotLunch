Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :groups, except: [:new] do
    resources :lunches do
      resources :swaps, only: %i[new create update] do
        resources :chatrooms, only: %i[new show] do
          resources :messages, only: :create
        end
      end
    end
  end
  resources :lunches, only: [] do
    resources :swaps, only: %i[new create]
    end
  resources :swaps, only: %i[index update]
  # get "/dashboard", to: "swaps#index"
end
