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

  resources :movies, only: %i[show index] do
    post 'add_review'
    get 'rating_info'
    post 'watchlist_it'
    collection do
      get 'search'
      get 'open_this_week'
    end
  end

  resources :newses, only: %i[index] do
    collection do
      get 'search'
    end
  end

  resources :genres, only: [] do
    collection do
      get 'movies_with_genre'
    end
  end

end
