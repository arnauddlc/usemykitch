Rails.application.routes.draw do
  get 'kitchens/index'

  get 'kitchens/new'

  get 'kitchens/show'

  get 'kitchens/edit'

  devise_for :users
  root to: 'kitchens#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kitchens
end
