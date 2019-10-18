class CreateCelebritiesMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :celebrities_movies do |t|
      t.references :movie, foreign_key: true
      t.references :celebrity, foreign_key: true
      t.timestamps
    end
  end
end
