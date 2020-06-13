class CreateDiet < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.text :description
      t.references :patient, null: true, foreign_key: true
    end
  end
end
