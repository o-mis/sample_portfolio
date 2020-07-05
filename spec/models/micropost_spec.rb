# == Schema Information
#
# Table name: microposts
#
#  id         :bigint           not null, primary key
#  arrived_at :integer          default("昼"), not null
#  budget     :decimal(5, 3)
#  content    :text(65535)      not null
#  image      :string(255)
#  restaurant :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { create(:micropost) }

  it '有効なファクトリを持つこと' do
    expect(micropost).to be_valid
  end

  it '利用時間帯、予算、コメント、画像が有効であること' do
    user = create(:user)
    micropost = Micropost.new(
      arrived_at: = '昼'
      budget: '~¥999'
      content: '本当に美味しかった',
      image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg')),
      restaurant: 'Contrail 神楽坂店'
    )
    expect(micropost).to be_valid
  end

  describe '文字数の検証' do
    it 'コンテンツが150字以内であれば有効であること' do
      micropost.content = 'a' * 150
      expect(micropost).to be_valid
    end
    it 'コンテンツが150文字以上であれば無効であること' do
      micropost.content = 'a' * 151
      expect(micropost).to_not be_valid
    end
  end

  describe '存在性の検証' do
    it '利用時間帯が選択されていない場合無効であること' do
      micropost.arrived_at = nil
      expect(micropost).to_not be_valid
    end

    it 'コンテンツが無い場合無効であること' do
      micropost.content = ''
      expect(micropost).to_not be_valid
    end

    it '店舗名が無い場合無効であること' do
      micropost.restaurant = ''
      expect(micropost).to_not be_valid
    end
  end
end
