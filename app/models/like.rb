class Like < ApplicationRecord
  validates :user_id, presence: true, uniqueness: {scope: :user_id}
  validates :micropost_id, presence: true
  validates_uniqueness_of :micropost_id, scope: :user_id
  belongs_to :user
  belongs_to :micropost
end
