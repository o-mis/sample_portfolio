class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :omniauthable
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :micropost
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_posts, through: :bookmarks, source: :micropost
  has_many :active_relationships, class_name:  "Relationship",
                    foreign_key: "follower_id",
                    dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                    foreign_key: "followed_id",
                    dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }

  mount_uploader :avatar, AvatarUploader

  def self.guest
    find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.zone.now
    end
  end

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
end
