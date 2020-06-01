class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :content, presence: true, length: { maximum: 140 }
  # validates :arrived_at, presence: true
  validates :restaurant, presence: true
  validates :image, presence: true

  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader

  enum arrived_at: { 昼: 0, 夜: 1 }

end
