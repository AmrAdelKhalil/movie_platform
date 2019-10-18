class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :image
      t.datetime :release_date
      t.timestamps
    end
  end
end
