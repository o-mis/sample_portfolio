class RemoveIndexFromLike < ActiveRecord::Migration[6.0]
  def change
    remove_index :likes, column: [:user_id, :micropost_id], unique: true
  end
end
