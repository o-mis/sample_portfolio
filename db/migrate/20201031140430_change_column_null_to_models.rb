class ChangeColumnNullToModels < ActiveRecord::Migration[6.0]
  def up
    change_column_null :likes, :micropost_id, true
    change_column_null :bookmarks, :micropost_id, true
  end

  def down
    change_column_null :likes, :micropost_id, false
    change_column_null :bookmarks, :micropost_id, false
  end
end
