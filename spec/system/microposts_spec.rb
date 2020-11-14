require 'rails_helper'

RSpec.describe 'Microposts', type: :system do
  context 'ログインしているとき' do
    before do
      @user = create(:user)

      visit '/sign_in'
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('.signin-btn').click
      expect(current_path).to eq root_path
      expect(page).to have_content 'ログインしました'
    end

    it '投稿の作成/閲覧/削除ができること', js: true do
      # 投稿する
      visit new_micropost_path
      expect(current_path).to eq new_micropost_path

      attach_file 'micropost[image]', "#{Rails.root}/spec/fixtures/test_post.jpg", make_visible: true
      fill_in '店舗名', with: 'すきやばし次郎'
      fill_in 'コメント', with: '楽しみに来ましたが緊張で味がしませんでした。'
      expect do
        click_button '投稿する'
      end.to change(Micropost, :count).by(1)
      expect(current_path).to eq root_path

      # 閲覧する
      micropost = Micropost.first

      visit "/microposts/#{micropost.id}"
      expect(micropost.image.present?).to be_present
      expect(micropost.address).to eq 'すきやばし次郎'
      expect(micropost.content).to eq '楽しみに来ましたが緊張で味がしませんでした。'
      expect(micropost.latitude.present?).to be_present
      expect(micropost.longitude.present?).to be_present

      # 削除する
      page.accept_confirm '削除してよろしいですか？' do
        click_link '削除'
      end

      expect(current_path).to eq root_path
    end
  end
end
