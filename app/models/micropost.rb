# == Schema Information
#
# Table name: microposts
#
#  id         :bigint           not null, primary key
#  address    :string(255)      default("")
#  arrived_at :integer          default("未選択"), not null
#  budget     :decimal(5, 3)
#  content    :text(65535)      not null
#  image      :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
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
  has_many :commented_users, through: :comments, source: :user
  validates :content, presence: true, length: { maximum: 150 }
  validates :arrived_at, presence: true
  validates :address, presence: true
  validates :image, presence: true

  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader

  enum arrived_at: { 未選択: 0, 昼: 1, 夜: 2 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_taggable

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

  def commented?(user)
    commented_users.include?(user)
  end
end
