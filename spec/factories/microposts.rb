# == Schema Information
#
# Table name: microposts
#
#  id         :bigint           not null, primary key
#  address    :string(255)      default("")
#  arrived_at :integer          default("no_choice"), not null
#  budget     :decimal(5, 3)
#  content    :text(65535)      not null
#  image      :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
FactoryBot.define do
  factory :micropost do
    arrived_at { "昼" }
    budget { 1 }
    content { '本当に美味しかった' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg')) }
    address { 'Contrail 神楽坂店' }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    association :user
  end
end
