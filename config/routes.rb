Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'movies/watchlist_it'
  get 'movies/search'
  get 'newses/search'
  get 'newses/index'
  get 'genres/movies_with_genre'
  get 'movies/open_this_week'
  root 'dashboards#index'
end
