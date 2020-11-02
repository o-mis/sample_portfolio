class AddColumnToChef < ActiveRecord::Migration[6.0]
  def change
    add_column :chefs, :user_id, :integer
  end
end
