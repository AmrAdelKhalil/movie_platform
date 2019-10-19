class CreateAwardsMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :awards_movies do |t|
      t.references :movie, foreign_key: true
      t.references :award, foreign_key: true
      t.timestamps
    end
  end
end
