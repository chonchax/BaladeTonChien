Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :dogs, only: %i[new create]

  resources :users, only: %i[index]
end
