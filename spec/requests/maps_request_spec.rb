require 'rails_helper'

RSpec.describe "Maps", type: :request do
  describe "GET /maps" do
    it 'マップ一覧へのリクエストが成功すること' do
      get maps_path
      expect(response).to have_http_status(200)
    end
  end
end
