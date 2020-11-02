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
class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
  validates :content, presence: true, length: { maximum: 150 }
  # validates :arrived_at, presence: true
  validates :address, presence: true
  validates :image, presence: true

  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  enum arrived_at: { no_choice: 0, day: 1, night: 2 }

  enum budget: { yen0: 0, yen1: 1, yen2: 2, yen3: 3, yen4: 4,
                  yen5: 5, yen6: 6, yen7: 7, yen8: 8, yen9: 9,
                  yen10: 10, yen20: 11, yen30: 12 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_taggable

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.micropost_id) FROM likes WHERE likes.micropost_id = microposts.id GROUP BY likes.micropost_id)'
    Arel.sql(query)
  end

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
