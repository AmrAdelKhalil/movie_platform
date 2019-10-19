Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  get 'movies/add_review'
  get 'movies/rating_info'
  get 'movies/watchlist_it'
  get 'movies/search'
  get 'newses/search'
  get 'newses/index'
  get 'genres/movies_with_genre'
  get 'movies/open_this_week'
  # get 'dashboards/index'
  root 'dashboards#index'
end
