require 'rails_helper'

RSpec.describe 'Login, Logout', type: :system do
  let!(:user) do
    create(
      :user,
      name: 'TestUser',
      email: 'user_test@example.com',
      password: 'password'
    )
  end

  describe 'ログイン' do
    let!(:admin) { create(:user, :admin) }

    it 'ゲストログインできること' do
      visit root_path
      find('.guest-login').click
      expect(current_path).to eq root_path
    end

    it '一般ユーザーとしてログインできること' do
      visit root_path
      find('.user-login').click
      expect(current_path).to eq sign_in_path

      fill_in 'メールアドレス', with: 'user_test@example.com'
      fill_in 'パスワード', with: 'password'
      find('.signin-btn').click
      expect(current_path).to eq root_path
      expect(page).to have_content 'ログインしました'
    end

    it '管理者としてログインできること' do
      visit root_path
      find('.user-login').click
      expect(current_path).to eq sign_in_path

      fill_in 'メールアドレス', with: 'admin_test@example.com'
      fill_in 'パスワード', with: 'abcdefg'
      find('.signin-btn').click
      expect(current_path).to eq root_path
      expect(page).to have_content 'ログインしました'
    end
  end
end
