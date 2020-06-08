class CreateChecklist < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.string :name, null: false
      t.boolean :status, default: false
      t.references :patient, null: true, foreign_key: true

      t.timestamps
    end
  end
end
