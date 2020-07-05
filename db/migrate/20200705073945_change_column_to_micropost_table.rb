class ChangeColumnToMicropostTable < ActiveRecord::Migration[6.0]
  def up
    change_column_null :microposts, :restaurant, false

    change_column_null :microposts, :content, false
  end

  def down
    change_column_null :microposts, :restaurant, true

    change_column_null :microposts, :content, true
  end
end
