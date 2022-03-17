require 'rails_helper'
require './spec/features/mock'

RSpec.describe 'Post index view', type: :feature do
  include Mock

  before :each do
    @users = create_users
    @foods = create_foods(@users)
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'john.doe@example.com'
      fill_in 'user_password', with: 'admin123'
    end
    click_button 'Log in'
  end

  context 'Food List page' do
    it 'can see the food table' do
      expect(page).to have_css('table')
    end

    it 'can see a food name' do
      food = Food.all.where(user_id: 1)
      food.each do |t|
        expect(page).to have_content t.name
      end
    end

    it 'can see a food measurement unit' do
      food = Food.all.where(user_id: 1)
      food.each do |t|
        expect(page).to have_content t.measurement_unit
      end
    end

    it 'can see a food price' do
      food = Food.all.where(user_id: 1)
      food.each do |t|
        expect(page).to have_content t.price
      end
    end

    it 'Should display food\'s title' do
      expect(page).to have_content('Foods')
    end
  end
  
end