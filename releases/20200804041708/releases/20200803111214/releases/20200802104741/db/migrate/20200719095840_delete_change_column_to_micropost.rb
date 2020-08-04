class DeleteChangeColumnToMicropost < ActiveRecord::Migration[6.0]
  def up
    change_column :microposts, :restaurant, :text
  end

  def down
    change_column :microposts, :restaurant, :string
  end
end
