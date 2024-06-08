Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top', as: :top
  get 'home/about', to: 'homes#about'
  resources :users, only: [:show, :edit, :update]
  resources :groups, only: [:show, :edit, :update, :index, :create, :destroy] do
    resource :chats, only: [:create, :destroy]
  end
  get "groups/:id/join" => "groups#join", as: "join_group"
  get "groups/:id/chat" => "groups#chat", as: "chat_group"
end
