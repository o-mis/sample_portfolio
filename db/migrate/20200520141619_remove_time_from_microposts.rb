class RemoveTimeFromMicroposts < ActiveRecord::Migration[6.0]
  def change

    remove_column :microposts, :time, :time
  end
end
