class ChangeMicropostColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :microposts, :restaurant, :string
  end
end
