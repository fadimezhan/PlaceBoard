class RenamePlacesIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :places_id, :place_id
  end
end
