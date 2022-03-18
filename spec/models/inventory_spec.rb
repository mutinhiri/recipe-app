require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject do
    Recipe.new(name: 'Kitchen Inventory')
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
