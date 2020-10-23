class AddColumnToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :chef_id, :integer
  end
end
