Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    # root to: "devise/sessions#new"
    authenticated :user do
      root 'dashboards#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  post 'movies/add_review'
  get 'movies/rating_info'
  post 'movies/watchlist_it'
  get 'movies/search'
  get 'newses/search'
  get 'newses/index'
  get 'genres/movies_with_genre'
  get 'movies/open_this_week'
  resources :movies, only: [:show, :index]
  # get 'dashboards/index'
  # root 'devise/sessions#new'
end
