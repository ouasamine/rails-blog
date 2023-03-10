Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index]
  end
  resources :posts, only: [:show, :new, :create] do 
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create]

  namespace :api do 
    resources :users, only: [:show] do
      resources :posts, only: [:index] do 
        resources :comments, only: [:index, :create]
      end
    end
  end
end
