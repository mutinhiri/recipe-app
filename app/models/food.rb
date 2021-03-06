class Food < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :measurement_unit
  validates_presence_of :price
end
