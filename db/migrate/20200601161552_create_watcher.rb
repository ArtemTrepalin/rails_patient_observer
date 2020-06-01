class CreateWatcher < ActiveRecord::Migration[6.0]
  def change
    create_table :watchers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :sur_name
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
