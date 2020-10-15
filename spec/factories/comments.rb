# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  content      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  micropost_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_comments_on_micropost_id  (micropost_id)
#  index_comments_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (micropost_id => microposts.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :comment do
    content { "美味しそうですね！" }
    association :micropost
    user { micropost.user }
  end
end
