Rails.application.routes.draw do
  get 'reservations/create'

  devise_for :owners
  get 'welcome/index'

  devise_for :customers
  resources :categories,only: [:index, :show]

  authenticated :customer do
    root 'places#index', as: 'authenticated_root_customer'
  end

  authenticated :owner do
    root 'places#index', as: 'authenticated_root_owner'
  end

  root 'welcome#index'

  resources :places do
    resources :comments, only: [:create]
    resources :reservations, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
