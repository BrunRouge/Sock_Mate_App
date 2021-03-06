Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users
  root to: 'pages#home'

  resources :socks, except: [:destroy] do
    resources :bookings, only: [:create, :show]
    member do
      patch 'status/hide', to: 'socks#status_hide'
    end
  end
  get 'bookings', to: 'bookings#index'
  get 'profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
