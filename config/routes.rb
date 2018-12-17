Rails.application.routes.draw do
  resources :users, :books, :authors
  root 'welcome#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
