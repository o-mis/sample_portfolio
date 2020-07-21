class RemoveRestaurantFromMicroposts < ActiveRecord::Migration[6.0]
  def change
    remove_column :microposts, :restaurant, :text
  end
end
