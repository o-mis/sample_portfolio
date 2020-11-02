class ChangeColumnToLikes < ActiveRecord::Migration[6.0]
  def up
    change_column_null :likes, :micropost_id, true
  end

  def down
    change_column_null :microposts, :micropost_id, false
  end
end
