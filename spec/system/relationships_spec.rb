require 'rails_helper'

RSpec.describe 'Relationships', type: :system, js: true do
  describe 'フォロー,フォロー解除' do
    it 'ログインユーザーがフォロー/フォロー解除できること' do
      bob = create(:user,
                   email: 'bob@example.com',
                   password: 'password_bob')

      alice = create(:user,
                     email: 'alice@example.com',
                     password: 'password_alice')

      # bobのログイン
      visit '/sign_in'
      fill_in 'メールアドレス', with: bob.email
      fill_in 'パスワード', with: bob.password
      find('.signin-btn').click
      expect(current_path).to eq root_path

      # aliceのユーザーページからフォロー
      visit user_path(alice)
      expect(page).to have_content '0 フォロワー'

      expect do
        click_button 'フォローする'
        expect(page).to have_content 'フォロー中'
      end.to change(bob.following, :count).by(1)
      expect(page).to have_content '1 フォロワー'
    end
  end
end
