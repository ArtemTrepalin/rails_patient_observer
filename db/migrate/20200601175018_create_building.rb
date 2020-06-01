class CreateBuilding < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :position
    end
  end
end
