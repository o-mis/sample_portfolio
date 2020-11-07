require 'rails_helper'

RSpec.describe 'ログイン、ログアウト', type: :system do
  let(:user) do
    create(:user,
           name: 'test',
           email: 'test@examle.com',
           password: 'testtest')
  end

  it 'ログインする' do
    visit root_path
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'testtest'
    click_on 'ログイン'
    expect(page).to have_content 'ログインしました'
  end
end
