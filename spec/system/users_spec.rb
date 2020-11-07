require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = User.create!(name: 'Test')
  end
end
