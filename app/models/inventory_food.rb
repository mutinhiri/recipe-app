class InventoryFood < ApplicationRecord
    belongs_to :inventory
    belongs_to :food

    validates :quantity, numericality: { greater_than: 0 }, presence: true
end
