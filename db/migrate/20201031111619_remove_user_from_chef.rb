class RemoveUserFromChef < ActiveRecord::Migration[6.0]
  def change
    remove_reference :chefs, :user, null: false, foreign_key: true
  end
end
