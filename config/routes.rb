Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: %i[index new create show destroy] do
    resources :attendances, only: %i[create]
  end

  resources :attendances, only: %i[destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
end
