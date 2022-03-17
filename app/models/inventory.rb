class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  has_many :foods, through: :inventory_foods
  accepts_nested_attributes_for :inventory_foods, allow_destroy: true

  validates :name, presence: true
end
