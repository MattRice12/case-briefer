Rails.application.routes.draw do
  resources :users
  root controller: 'users', action: 'index'
end
