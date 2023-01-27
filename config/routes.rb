Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do 
      resources :comment, only: [:new, :create]
      resources :like, only: [:create]
    end
  end
end
