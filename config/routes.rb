Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :mangas do
    resources :chapters, only: [:show]
    resources :manga_reviews, only: [:create]
    resource :bookmark, only: [:create, :destroy]
  end

  resources :chapters, only: [] do
    resources :chapter_reviews, only: [:create]
  end

  root to: "mangas#index"
end
