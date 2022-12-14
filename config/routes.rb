Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :groups, except: [:new] do
    resources :lunches do
      resources :swaps, only: %i[new create update] do
        # resources :chatrooms, only: %i[new show] do #non necessaire
        #   resources :messages, only: :create #non necessaire
        # end
      end
    end
  end
  resources :lunches, only: [] do
    resources :swaps, only: %i[new create]
  end

  resources :swaps, only: %i[index update] do
    resources :messages, only: :create
  end

  get 'notifications/mark_as_read', to: 'notifications#mark_as_read'

  # get "/dashboard", to: "swaps#index"
  post 'lunches/:lunch_id', to: "swaps#initiate_chat", as: :new_swap_for_chat
  get 'swaps/:swap_id/chatroom', to: "swaps#chatroom", as: :swap_chatroom

  # route custon link affiliate
  get 'groups/:group_id/join', to: "groups#join", as: :join_group
end

# swap id a rajouter a messages
