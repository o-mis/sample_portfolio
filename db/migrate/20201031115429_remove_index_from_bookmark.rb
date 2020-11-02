class RemoveIndexFromBookmark < ActiveRecord::Migration[6.0]
  def change
    remove_index :bookmarks, column: [:user_id, :micropost_id], unique: true
  end
end
