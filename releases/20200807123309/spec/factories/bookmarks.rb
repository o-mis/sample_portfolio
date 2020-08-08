# == Schema Information
#
# Table name: bookmarks
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  micropost_id :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_bookmarks_on_micropost_id              (micropost_id)
#  index_bookmarks_on_user_id                   (user_id)
#  index_bookmarks_on_user_id_and_micropost_id  (user_id,micropost_id) UNIQUE
#
FactoryBot.define do
  factory :bookmark do
    
  end
end
