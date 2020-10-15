class ChangeColumnToChef < ActiveRecord::Migration[6.0]
  def change
    rename_column :chefs, :photo, :image
  end
end
