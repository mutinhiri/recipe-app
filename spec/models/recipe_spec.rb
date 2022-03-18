require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(
      name: 'quinoa',
      preparation_time: 1,
      cooking_time: 10,
      description: 'good food',
      public: true
    )
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a preparation time' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without cooking time' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'description is required' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it 'public is required' do
    subject.public = nil
    expect(subject).to_not be_valid
  end
  it 'measurement unit is required' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
