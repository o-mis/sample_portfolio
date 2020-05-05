class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:twitter]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(
      provider: auth.provider,
      uid: auth.uid,
      username: auth.info.nickname,
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )

    user
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do | user |
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  has_many :microposts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }


end
