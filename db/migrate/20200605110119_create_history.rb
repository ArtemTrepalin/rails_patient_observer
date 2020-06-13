class CreateHistory < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.string :temperature
      t.string :pressure
      t.references :patient, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.timestamps
    end
  end
end
