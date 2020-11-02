class ChangeColumnNullToLikes < ActiveRecord::Migration[6.0]
  def up
    change_column_null :likes, :micropost_id, false
  end

  def down
    change_column_null :microposts, :micropost_id, true
  end
end
