class ChangeDataAddressToMicropost < ActiveRecord::Migration[6.0]
  def up
    change_column_default :microposts, :address, ""
  end
end
