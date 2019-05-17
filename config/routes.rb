Rails.application.routes.draw do
  resources :users do
    resources :books, :authors
  end
  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/shelf', to: 'users#shelf'
  post '/shelf', to: 'users#shelf'
  get '/users/:id/most_recent_book', to: 'books#most_recent_book', as: '/most_recent_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
