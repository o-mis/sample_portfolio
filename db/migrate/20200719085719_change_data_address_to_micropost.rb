class ChangeDataAddressToMicropost < ActiveRecord::Migration[6.0]
  def change
    change_column_default :microposts, :address, ""
  end
end
