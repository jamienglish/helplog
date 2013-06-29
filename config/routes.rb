Helplog::Application.routes.draw do
  root to: 'posts#index'

  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :sessions
  delete 'logout', to: 'sessions#destroy', as: :logout

  resources :posts
end
