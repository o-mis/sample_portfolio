# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  avatar                 :string(255)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  it '有効なファクトリを持つこと' do
    expect(build(:user)).to be_valid
  end

  it 'ユーザー名、メールアドレス、パスワードが有効であること' do
    user = User.new(
                name: 'テストユーザー',
                email: 'test@example.com',
                password: 'password'
    )
    expect(user).to be_valid
  end

  describe '存在性の検証' do
    it 'ユーザー名が無ければ無効であること' do
      @user.name = ''
      @user.valid?
      expect(@user.errors).to be_of_kind(:name, :blank)
    end

    it 'メールアドレスが無ければ無効であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors).to be_of_kind(:email, :blank)
    end

    it 'パスワードが無ければ無効であること' do
      @user.password = @user.password_confirmation = '' * 6
      @user.valid?
      expect(@user.errors).to be_of_kind(:password, :blank)
    end
  end

  describe 'フォーマットの検証' do
    it 'メールアドレスが正当な形式であれば有効であること' do
      valid_emails = %w[example@example.com EXAMPLE@example.COM EX_AMPL_E@example.foo.org
                        e.xample@example.jp example_123@example.com example+foo@example.com]
      valid_emails.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
      end
    end

    it 'メールアドレスが不正な形式であれば無効であること' do
      invalid_emails = %w[test@example,com test@example. test@example-com test@example+com
                          tえst@example.com test@exあmple.com]
      invalid_emails.each do |invalid_email|
        @user.email = invalid_email
        @user.valid?
        expect(@user.errors).to be_of_kind(:email, :invalid)
      end
    end
  end

  describe '一意性の検証' do
    it '重複したメールアドレスなら無効であること' do
      user1 = create(:user, name: 'cont', email: 'cont@example.com')
      user2 = build(:user, name: 'rail', email: 'cont@example.com')
      expect(user2).to_not be_valid
    end
  end

  describe '文字数の検証' do
    it 'ユーザー名が10文字以内であれば有効であること' do
      @user.name = 'a' * 10
      expect(@user).to be_valid
    end

    it 'ユーザー名が10文字以上なら無効であること' do
      @user.name = 'a' * 11
      expect(@user).to_not be_valid
    end

    it 'メールアドレスは255文字以内であれば有効であること' do
      @user.email = 'a' * 243 + '@example.com'
      expect(@user).to be_valid
    end

    it 'メールアドレスが255字以上なら無効であること' do
      @user.email = 'a' * 244 + '@example.com'
      @user.valid?
      expect(@user).to_not be_valid
    end

    it 'パスワードが6文字以上であれば有効であること' do
      @user.password = @user.password_confirmation = 'a' * 6
      expect(@user).to be_valid
    end

    it 'パスワードが6文字未満であれば無効であること' do
      @user.password = @user.password_confirmation = 'a' * 5
      @user.valid?
      expect(@user.errors).to be_of_kind(:password, :too_short)
    end
  end
end
