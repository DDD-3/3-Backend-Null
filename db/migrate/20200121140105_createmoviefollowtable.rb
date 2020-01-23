class Createmoviefollowtable < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_movies do |t|
      t.references :user, foreign_key: true
      t.string :movie_id

      t.timestamps
    end
  end
end
