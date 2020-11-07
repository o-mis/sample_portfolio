require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'ルートパスの検証' do
    it 'リクエストが成功すること' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
