class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :movie_id
      t.string :movie_name
      t.string :movie_thumb
      t.string :content
      t.boolean :is_spoiler, default: false
      t.integer :like_count
      
      t.timestamps
    end
  end
end
