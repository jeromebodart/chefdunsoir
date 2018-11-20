Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  root to: 'restaurants#index'
  devise_for :users
  resources :restaurants do
    resources :reservations, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reviews

end
