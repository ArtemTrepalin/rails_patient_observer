class CreateAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :location
      t.references :patient, null: true, foreign_key: true
    end
  end
end
