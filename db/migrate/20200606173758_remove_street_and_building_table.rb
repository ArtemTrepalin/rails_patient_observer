class RemoveStreetAndBuildingTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :patients, :streets
    remove_column :patients, :street_id
    drop_table(:street_buildings, if_exists: true)
    drop_table(:streets, if_exists: true)
    drop_table(:buildings, if_exists: true)
  end
end
