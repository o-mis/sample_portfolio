class ChangeColumnToMicropost < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column_null :microposts, :image, false
      change_column :microposts, :image, :string
    end

    def down
      change_column_null :microposts, :image, true
      change_column :microposts, :image, :string
    end
  end
end
