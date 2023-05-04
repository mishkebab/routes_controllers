Rails.application.routes.draw do
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/users', to: 'users#index', as: "users"
  # post '/users', to: 'users#create'
  # get '/users/:id', to: 'users#show', as: "user"
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # get '/users/new', to: 'users#new', as: "new_user"
  # get '/users/:id/edit', to: 'users#edit', as: "edit_user"

  resources :users, only: [:create, :destroy, :index, :show, :update] 

  resources :artworks, only: [:create, :destroy, :index, :show, :update] 

end
