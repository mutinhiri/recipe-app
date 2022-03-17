class RemoveFoodReferenceFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :food, index: true, foreign_key: true
  end
end
