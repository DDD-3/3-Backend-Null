class AddUserMovieLikeCount < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :movie_like_count, :integer, default: 0
  end
end
