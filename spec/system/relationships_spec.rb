require 'rails_helper'

RSpec.describe 'Relationships', type: :system, js: true do
  describe 'フォロー,フォロー解除' do
    it 'ログインユーザーがフォロー/フォロー解除できること' do
      bob = create(:user,
                   name: 'Bob',
                   email: 'bob@example.com',
                   password: 'password_bob')

      alice = create(:user,
                     name: 'Alice',
                     email: 'alice@example.com',
                     password: 'password_alice')

      # bobがログイン
      visit '/sign_in'
      fill_in 'メールアドレス', with: bob.email
      fill_in 'パスワード', with: bob.password
      find('.signin-btn').click
      expect(current_path).to eq root_path

      # aliceのユーザーページからフォロー
      visit user_path(alice)
      expect(page).to have_content '0 フォロワー'

      expect do
        find('.btn-follow').click
        expect(page).to have_content '1 フォロワー'
      end.to change(bob.following, :count).by(1) &
             change(alice.followers, :count).by(1)

      # bobがマイページから確認
      visit user_path(bob)
      expect(page).to have_content '1 フォロー中'

      # aliceをユーザーページからフォロー解除
      visit user_path(alice)
      expect(page).to have_content '1 フォロワー'

      expect do
        find('.btn-unfollow').click
        expect(page).to have_content '0 フォロワー'
      end.to change(bob.following, :count).by(-1) &
             change(alice.followers, :count).by(-1)

      # bobがマイページから確認
      visit user_path(bob)
      expect(page).to have_content '0 フォロー中'
    end
  end
end
