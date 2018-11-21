Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :restaurants do

    resources :reservations, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :reservations, only: [:index]
  end

  resources :reviews
end
