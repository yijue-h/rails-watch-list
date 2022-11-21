Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "movies#index"
  resources :lists, only: [:index, :new, :show, :create] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :movies do
    resources :bookmarks, only: [:create, :show]
  end

  resources :bookmarks, only: :destroy
end
