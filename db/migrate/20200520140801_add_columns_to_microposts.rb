class AddColumnsToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :budget, :decimal, precision: 5, scale: 3
    add_column :microposts, :restaurant, :text
  end
end
