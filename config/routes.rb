Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :dogs, only: %i[new create] do
    resources :walks, only: %i[index show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :users, only: %i[index]
end
