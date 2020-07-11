# == Schema Information
#
# Table name: microposts
#
#  id         :bigint           not null, primary key
#  arrived_at :integer          default("昼"), not null
#  budget     :decimal(5, 3)
#  content    :text(65535)      not null
#  image      :string(255)
#  restaurant :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { maximum: 150 }
  validates :arrived_at, presence: true
  validates :restaurant, presence: true

  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader

  enum arrived_at: { 昼: 0, 夜: 1 }

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  def liked?(user)
    liked_users.include?(user)
  end

  def bookmark(user)
    bookmarks.create(user_id: user.id)
  end

  def unbookmark(user)
    bookmarks.find_by(user_id: user.id).destroy
  end

  def bookmarked?(user)
    bookmarked_users.include?(user)
  end
end
