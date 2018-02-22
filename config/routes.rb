Rails.application.routes.draw do

  devise_for :users
  root to: 'kitchens#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kitchens do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:destroy] do
    member do
      patch 'decline'
      patch 'approve'
    end
  end

  get "/dashboard", to: 'dashboards#show', as: :show_dashboard

  # patch "/bookings/:id/decline", to: "bookings#decline", as: :decline_booking
  # patch "/bookings/:id/approve", to: "bookings#approve", as: :approve_booking
end
