require 'rails_helper'

RSpec.describe 'Microposts', type: :request do
  describe 'GET /microposts' do
    it '検索画面へのリクエストが成功すること' do
      get search_microposts_path
      expect(response).to have_http_status(200)
    end
  end
end
