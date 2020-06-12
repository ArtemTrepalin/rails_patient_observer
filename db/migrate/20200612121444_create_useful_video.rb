class CreateUsefulVideo < ActiveRecord::Migration[6.0]
  def change
    create_table :useful_videos do |t|
      t.text :description
      t.string :link
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
