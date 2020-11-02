# == Schema Information
#
# Table name: likes
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
#  index_likes_on_micropost_id  (micropost_id)
#  index_likes_on_user_id       (user_id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, optional: true
  validates :user_id, presence: true
  # validates :micropost_id, presence: true
end
