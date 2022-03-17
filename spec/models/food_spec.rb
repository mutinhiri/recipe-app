require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    Food.new(
      name: 'Apple',
      measurement_unit: 'gram',
      price: 10,
      user_id: 1
    )
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a measurement unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'price is required' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  it 'measurement unit is required' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end
end
