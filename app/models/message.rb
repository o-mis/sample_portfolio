# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chef_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_chef_id  (chef_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chef_id => chefs.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chef

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 150 }
end
