Rails.application.routes.draw do
  resources :gifters
  resources :occasions
  resources :users, :books, :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
