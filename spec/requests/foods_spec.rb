require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  current_user = User.first_or_create!(
    name: 'John Doe',
    email: 'john.doe@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => 'Apple',
      'measurement_unit' => 'gram',
      'price' => '10',
      'user' => current_user
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'name' => nil,
      'measurement_unit' => 'gram',
      'price' => '10'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      food = Food.new(valid_attributes)
      food.user = current_user
      food.save
      get foods_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      food = Food.new(valid_attributes)
      food.user = current_user
      food.save
      get food_url(food)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'redirects to the foods list' do
      food = Food.new(valid_attributes)
      food.user = current_user
      food.save
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
