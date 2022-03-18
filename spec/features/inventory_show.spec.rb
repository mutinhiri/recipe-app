require 'rails_helper'

RSpec.describe 'inventory#index', type: :feature do
  before :each do
    @current_user = User.create(name: 'Nicu', email: 'test@test.com', password: 'password' )
    @current_user.inventories.create(name: 'Inventory 1')    
  end

  describe 'when vising main page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Inventory'
      click_link 'Show'
    end

    it "Inventory list to display name" do
      expect(page).to have_text('Inventory 1')
    end

    it "Inventory list to be empty" do
      expect(page).to have_text('No items in this inventory')
    end

    it "Button to add new items to be visible" do
      expect(page).to have_css('.add-items')
    end

     it "Button to add new items to be visible" do
      expect(page).to have_selector(:link_or_button, 'Add items')
    end

    it "Button to destroy inventory" do
       expect(page).to have_selector(:link_or_button, 'Destroy Inventory')      
    end

    it "Button to rename inventory" do
       expect(page).to have_selector(:link_or_button, 'Rename Inventory')      
    end
  end
end
