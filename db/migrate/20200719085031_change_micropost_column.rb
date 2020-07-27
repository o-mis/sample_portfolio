class ChangeMicropostColumn < ActiveRecord::Migration[6.0]
  def up
    change_column :microposts, :restaurant, :string
  end
end
