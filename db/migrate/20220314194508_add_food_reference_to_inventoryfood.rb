class AddFoodReferenceToInventoryfood < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :food, foreign_key: true
  end
end
