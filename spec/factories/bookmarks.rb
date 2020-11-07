# == Schema Information
#
# Table name: bookmarks
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chef_id      :integer
#  micropost_id :integer
#  user_id      :integer          not null
#
# Indexes
#
#  index_bookmarks_on_micropost_id  (micropost_id)
#  index_bookmarks_on_user_id       (user_id)
#
FactoryBot.define do
  factory :bookmark do
  end
end
