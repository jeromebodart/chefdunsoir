Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :restaurants do
    resources :reservations, only: [:create]
    resources :reviews, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :profile do
    resources :reservations, only: [:index, :destroy]
    resources :restaurants, only: [:index, :show]
  end

end
