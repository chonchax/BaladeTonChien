Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :dogs, only: %i[new create] do
    resources :walks, only: %i[index show]
  end

  # Profil du chien
  get '/mydog', to: 'dogs#mydog', as: "my_dog"

  resources :users, only: %i[index]
  resources :tindogs, only: %i[index create]

  resources :matches, only: %i[show] do
    resources :messages, only: %i[create]
  end

  # erreur de t'as trop swipé
  get '/noswipe', to: 'tindogs#noswipe', as: "no_swipe"
  
end
