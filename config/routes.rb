Rails.application.routes.draw do
  devise_for :owners
  get 'welcome/index'

  devise_for :customers
  resources :categories,only: [:index, :show]

  authenticated :owner do
    root 'places#index', as: 'authenticated_root'
  end

  root 'welcome#index'

  resources :places do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
