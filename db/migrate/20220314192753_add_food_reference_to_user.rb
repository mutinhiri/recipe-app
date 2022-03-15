class AddFoodReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :food, foreign_key: true
  end
end
