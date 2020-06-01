class CreateSickness < ActiveRecord::Migration[6.0]
  def change
    create_table :sicknesses do |t|
      t.string :name
    end
  end
end
