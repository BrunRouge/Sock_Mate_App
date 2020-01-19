Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :socks, except: [:destroy] do
    resources :bookings, only: [:index, :create, :show]
    member do
      patch 'status/hide', to: 'socks#status_hide'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
