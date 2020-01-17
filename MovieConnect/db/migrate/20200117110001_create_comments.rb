class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.string :content
      t.integer :like_count

      t.timestamps
    end
  end
end
