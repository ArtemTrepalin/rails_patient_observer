class CreateStreet < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.string :name
    end
  end
end