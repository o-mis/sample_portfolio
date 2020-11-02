class RemoveChefIdFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :chef_id, :integer
  end
end
