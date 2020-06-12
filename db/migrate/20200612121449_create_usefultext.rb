class CreateUsefulText < ActiveRecord::Migration[6.0]
  def change
    create_table :usefultexts do |t|
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
