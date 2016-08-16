class AddOwnerToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :owner, foreign_key: true
  end
end
