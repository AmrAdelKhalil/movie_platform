class CreateFilmRatingsMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :film_ratings_movies do |t|
      t.references :movie, foreign_key: true
      t.references :film_rating, foreign_key: true
      t.timestamps
    end
  end
end
