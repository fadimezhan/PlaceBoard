Rails.application.routes.draw do

  resources :categories,only: [:index, :show]

  root 'places#index'

  resources :places do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
