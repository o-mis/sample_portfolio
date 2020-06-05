class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :micropost
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }

  def self.guest
    find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.zone.now
    end
  end

  # def already_liked?(micropost)
  #   self.likes.exists?(micropost_id: params[:micropost_id])
  # end
end
