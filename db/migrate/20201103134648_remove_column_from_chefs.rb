class RemoveColumnFromChefs < ActiveRecord::Migration[6.0]
  def change
    remove_column :chefs, :user_id, :integer
  end
end
