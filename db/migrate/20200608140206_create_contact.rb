class CreateContact < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.references :patient, null: true, foreign_key: true
    end
  end
end
