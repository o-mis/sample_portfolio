# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  content      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chef_id      :integer
#  micropost_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_comments_on_micropost_id  (micropost_id)
#  index_comments_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (micropost_id => microposts.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  it '有効なファクトリを持つこと' do
    expect(comment).to be_valid
  end

  it 'コメントに関連した情報が存在する場合有効であること' do
    user = create(:user)
    micropost = create(:micropost)
    comment = Comment.new(
      content: '本当に美味しかった！',
      user: user,
      micropost: micropost
    )
    expect(comment).to be_valid
  end

  it 'コメント内容がない場合無効であること' do
    comment.content = ''
    comment.valid?
    expect(comment).to_not be_valid
  end

  describe '文字数の検証' do
    it 'コメント内容が150字以内であれば有効であること' do
      comment.content = 'a' * 150
      expect(comment).to be_valid
    end

    it 'コメント内容が150字以上であれば無効であること' do
      comment.content = 'a' * 151
      comment.valid?
      expect(comment).to_not be_valid
    end
  end
end
