require 'rails_helper'

RSpec.it User, type: :model do
  before do
    @user = build(:user)
  end

  it 'ユーザー名、メールアドレス、パスワードが有効であること' do
    user = User.create(
                name: 'テストユーザー',
                email: 'test@example.com',
                password: 'password'
    )
    expect(user).to be_valid
  end

  describe '存在性の検証' do
    it 'ユーザー名が無ければ無効であること' do
      @user.name = nil
      @user.valid?
      expect(@user).to_not be_valid
    end

    it 'メールアドレスが無ければ無効であること' do
      @user.email = nil
      @user.valid?
      expect(@user).to_not be_valid
    end
  end

  describe '形式の検証' do
    it 'ユーザー名が正当な形式であれば有効であること' do
      valid_usernames = %w[aaaa aaaa_ aaaa0]
      valid_usernames.each do |valid_username|
        @user.name = valid_username
        expect(@user).to be_valid
    end
    it 'ユーザー名が不正な形式であれば無効であること' do
      invalid_usernames = %w[aaaa- aaaa+ aaaa! aaaa? aaaa@ aaaa# aaaa$ aaaa%
                              aaaa` aaaa& aaaa* aaaa, aaaa. ああああ]
      invalid_usernames.each do |invalid_username|
        @user.name = invalid_username
        expect(@user).to_not be_valid
    end
    it 'メールアドレスが正当な形式であれば有効であること' do
      valid_emails = %w[spec@example.com SPEC@example.COM S_PE-C@example.foo.org
                        s.pec@example.jp spec_123@example.com spec+spec@example.com]
      valid_emails.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
    end
    it 'メールアドレスが不正な形式であれば無効であること' do
      invalid_emails = %[spec@example,com SPEC@example. spec@example-com spec@example+com
                          spec@example spえc@example.com spec@exあmple.com]
      invalid_emails.each do |invalid_email|
        @user.email = invalid_email
        expect(@user).to_not be_valid
    end
  end

  describe '一意性の検証' do
    it '重複したメールアドレスなら無効であること' do
      user = create(:user, email: 'test@example.com')
      same_user = build(:user, email: 'test@example.com')
      same_user.valid?
      expect(same_user).to_not be_valid
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
      @user.email = 'a' * 255
      expect(@user).to be_valid
    end
    it 'メールアドレスが255字以上なら無効であること' do
      @user.email = 'a' * 256
      expect(@user).to_not be_valid
    end
  end

  describe'依存性の検証' do
    it 'ユーザーを削除すると投稿も削除される' do
      user = create(:user, :with_micropost, micropost_count: 1)
      expect { user.destroy }.to change(Micropost, :count).by(-1)
    end
    it 'ユーザーを削除するといいね履歴も削除される' do
      user = create(:user)
      micropost = create(:micropost)
      user.like(:micropost)
      expect { micropost.liked? }.to change(Like, :count).by(-1)
    end
    it 'ユーザーを削除するとブックマーク履歴も削除される' do
      user = create(:user, :with_bookmark, bookmark_count: 1)
      expect { user.destroy }.to change(Bookmark, :count).by(-1)
    end
    it 'ユーザーを削除すると他のユーザーとのフォロー関係も削除される' do
      user = create(:user)
      following_user = create(:user)
      user.follow(following_user)
      expect { user.destroy }.to change(following_user.followers.count).by(-1)
    end
    it 'ユーザーを削除すると他のユーザーとのフォロワー関係も削除される' do
      user = create(:user)
      follower_user = create(:user)
      follower_user.follow(user)
      expect { user.destroy }.to change(follower_user.followings.count).by(-1)
    end
  end
end
