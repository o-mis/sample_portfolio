class CreateComments < ActiveRecord::Migration[6.0]
  def up
    create_table :content do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
