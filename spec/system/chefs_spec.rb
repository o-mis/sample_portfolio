# require 'rails_helper'

# RSpec.describe 'Chefs', type: :system do
#   context 'ログインしているとき' do
#     before do
#       @user = create(:user)

#       visit '/sign_in'
#       fill_in 'メールアドレス', with: @user.email
#       fill_in 'パスワード', with: @user.password
#       find('.signin-btn').click
#       expect(current_path).to eq root_path
#       expect(page).to have_content 'ログインしました'
#     end

#     it '投稿の作成/閲覧/削除ができること', js: true do
#       # 投稿する
#       visit new_chef_path
#       expect(current_path).to eq new_chef_path

#       attach_file 'chef[image]', "#{Rails.root}/spec/fixtures/test_chef.jpg", make_visible: true
#       fill_in '店舗名', with: '天丼ふじ 池袋'
#       fill_in 'コメント', with: '本日は穴子の天ぷらをご用意しております。通常の天ぷらに追加することも可能です！'
#       expect do
#         click_button '投稿する'
#       end.to change(Chef, :count).by(1)

#       expect(current_path).to eq chefs_path
#       expect(page).to have_content 'お知らせを投稿しました'

#       # 閲覧する
#       chef = Chef.first

#       visit "/chefs/#{chef.id}"
#       expect(chef.image.present?).to be_present
#       expect(chef.address).to eq '天丼ふじ 池袋'
#       expect(chef.comment).to eq '本日は穴子の天ぷらをご用意しております。通常の天ぷらに追加することも可能です！'
#       expect(chef.latitude.present?).to be_present
#       expect(chef.longitude.present?).to be_present

#       # 削除する
#       page.accept_confirm '削除してよろしいですか？' do
#         click_link '削除'
#       end

#       expect(current_path).to eq chefs_path
#       expect(page).to have_content 'お知らせを削除しました'
#     end
#   end
# end
