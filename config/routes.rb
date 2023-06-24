Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: redirect('/users', status: 302)
  # resources :users, only: %i[index show] do
  #   resources :posts, only: %i[index show]
  # end
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
end
