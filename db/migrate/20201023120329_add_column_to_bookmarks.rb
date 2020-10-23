class AddColumnToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :chef_id, :integer
  end
end
