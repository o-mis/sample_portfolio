class ChanegeColumnToUser < ActiveRecord::Migration[6.0]
  def up
    change_column_null :users, :name, false, ""
    change_column :users, :name, :string, default: ""
  end

  def down
    change_column_null :users, :name, true, nil
    change_column :users, :name, :string, default: nil
  end
end
