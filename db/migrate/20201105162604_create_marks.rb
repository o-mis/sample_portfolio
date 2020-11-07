class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.integer :user_id, null: false
      t.integer :chef_id, null: false

      t.timestamps

      t.index :user_id
      t.index :chef_id
      t.index [:user_id, :chef_id], unique: true
    end
  end
end
