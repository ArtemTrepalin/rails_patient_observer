class CreateStreetBuildingTable < ActiveRecord::Migration[6.0]
  def change
    create_table :street_buildings do |t|
      t.references :street, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true
      t.index [:street_id, :building_id],unique: true
    end
  end
end
