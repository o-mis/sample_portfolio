require 'rails_helper'

Rspec.describe 'Users', type: :system do
  before do
    @user = User.create!(name: "Test")
  end
  
  end
end
