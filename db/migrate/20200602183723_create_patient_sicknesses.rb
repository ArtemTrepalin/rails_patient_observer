class CreatePatientSicknesses < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_sicknesses do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :sickness, null: false, foreign_key: true
      t.index [:patient_id, :sickness_id],unique: true

      t.timestamps
    end
  end
end
