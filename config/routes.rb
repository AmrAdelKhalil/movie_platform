Rails.application.routes.draw do
  get 'newses/search'
  get 'newses/index'
  get 'genres/movies_with_genre'
  get 'movies/open_this_week'
  get 'dashboards/index'
end
