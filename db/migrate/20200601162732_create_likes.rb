class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :micropost_id, null: false

      t.timestamps

      add_index :user_id
      add_index :micropost_id
      add_index [:user_id, :micropost_id], unique: true
    end
  end
end
