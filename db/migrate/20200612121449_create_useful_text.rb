class CreateUsefulText < ActiveRecord::Migration[6.0]
  def change
    create_table :useful_texts do |t|
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
