# == Schema Information
#
# Table name: chefs
#
#  id         :bigint           not null, primary key
#  address    :string(255)      default("")
#  comment    :text(65535)      not null
#  image      :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_chefs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Chef < ApplicationRecord
  belongs_to :user
  has_many :marks, dependent: :destroy
  has_many :marked_users, through: :marks, source: :user
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user

  validates :comment, presence: true
  validates :address, presence: true
  validates :image, presence: true

  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_taggable

  def mark(user)
    marks.create(user_id: user.id)
  end

  def unmark(user)
    marks.find_by(user_id: user.id).destroy
  end

  def marked?(user)
    marked_users.include?(user)
  end
end
