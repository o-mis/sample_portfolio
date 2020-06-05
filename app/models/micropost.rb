class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  validates :content, presence: true, length: { maximum: 140 }
  # validates :arrived_at, presence: true
  validates :restaurant, presence: true
  validates :image, presence: true

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
