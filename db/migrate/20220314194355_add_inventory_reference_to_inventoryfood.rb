class AddInventoryReferenceToInventoryfood < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :inventory, foreign_key: true
  end
end
