require 'rails_helper'

RSpec.describe 'inventory#index', type: :feature do
  before :each do
    @current_user = User.create(name: 'Nicu', email: 'test@test.com', password: 'password')
    @current_user.inventories.create(name: 'Inventory 1')
    @current_user.inventories.create(name: 'Inventory 2')
    @current_user.inventories.create(name: 'Inventory 3')
    @current_user.inventories.create(name: 'Inventory 4')
  end
  describe 'when vising main page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Inventory'
    end

    it 'Button to add new items to be visible' do
      expect(page).to have_css('.add-inventory')
    end

    it 'Button to add new items to be visible' do
      expect(page).to have_selector(:link_or_button, 'New inventory')
    end

    it 'Inventory list to have Inventory 1' do
      expect(page).to have_text('Inventory 1')
    end

    it 'Inventory list to have Inventory 1' do
      expect(page).to have_selector(:link_or_button, 'Show')
    end

    it 'Inventory list to have Inventory 1' do
      expect(page).to have_selector(:link_or_button, 'Delete')
    end

    it 'Inventory list to have Inventory 2' do
      expect(page).to have_text('Inventory 2')
    end

    it 'Inventory list to have Inventory 3' do
      expect(page).to have_text('Inventory 3')
    end

    it 'Inventory list to have Inventory 4' do
      expect(page).to have_text('Inventory 4')
    end
  end
end
