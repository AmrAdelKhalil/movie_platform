class CreateFilmRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :film_ratings do |t|
      t.string :name

      t.timestamps
    end
  end
end
