class CreateFollowMovies < ActiveRecord::Migration[6.0]
  def change
    # NOTE : 기존에 테이블을 만들어 놓았기 때문에 테이블은 따로 만들지 않음

    add_index :follow_movies, :movie_id
    add_index :follow_movies, [:user_id, :movie_id], unique: true
  end
end
