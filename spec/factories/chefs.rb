# == Schema Information
#
# Table name: chefs
#
#  id         :bigint           not null, primary key
#  address    :string(255)      default("")
#  comment    :text(65535)      not null
#  image      :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
FactoryBot.define do
  factory :chef do
    
  end
end
