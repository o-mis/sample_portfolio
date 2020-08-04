class AddColumnToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :arrived_at, :integer, null: false, default: 0
  end
end
