require 'rails_helper'

RSpec.describe 'Signup', type: :system do
  it 'アカウント新規登録ができること', js: true do
    visit new_user_registration_path
    expect(page).to have_content '新規登録'

    fill_in 'ユーザー名(10文字以内)', with: 'Kenobi'
    fill_in 'メールアドレス', with: 'kenobi@example.com'
    fill_in 'パスワード(6文字以上)', with: 'password_kenobi'
    fill_in 'パスワード確認', with: 'password_kenobi'
    click_button '登録'

    expect(current_path).to eq root_path
    expect(page).to have_content 'アカウント登録が完了しました'
  end

  it 'アカウント登録に失敗すること', js: true do
    visit new_user_registration_path
    expect(page).to have_content '新規登録'

    # 空欄のとき
    fill_in 'ユーザー名(10文字以内)', with: ''
    fill_in 'メールアドレス', with: ''
    fill_in 'パスワード(6文字以上)', with: ''
    fill_in 'パスワード確認', with: ''
    click_button '登録'

    aggregate_failures do
      expect(page).to have_content 'ユーザー名を入力してください'
      expect(page).to have_content 'メールアドレスを入力してください'
      expect(page).to have_content 'メールアドレスは不正な値です'
      expect(page).to have_content 'パスワードを入力してください'
    end

    # ユーザー名のバリデーションに失敗
    fill_in 'ユーザー名(10文字以内)', with: 'Obi Wan Kenobi'
    click_button '登録'

    expect(page).to have_content 'ユーザー名は10文字以内で入力してください'

    # パスワードのバリデーションに失敗
    fill_in 'パスワード(6文字以上)', with: 'Obi'
    click_button '登録'

    expect(page).to have_content 'パスワードは6文字以上で入力してください'
  end
end
