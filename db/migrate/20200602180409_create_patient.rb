class CreatePatient < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :sur_name
      t.string :phone_number
      t.string :address
      t.string :sickness
      t.integer :height
      t.integer :weight
      t.references :watcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
