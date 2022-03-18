require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  before :each do
    @current_user = User.create(name: 'Nicu', email: 'test@test.com', password: 'password')
    @current_user.inventories.create(name: 'Inventory 1')
  end

  describe 'when vising main page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Inventory'
    end
  end

  describe 'GET /index' do
    it 'get base page' do
      get '/inventories'
      expect(response).to have_http_status(302)
    end
  end
end
