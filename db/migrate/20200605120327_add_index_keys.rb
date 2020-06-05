class AddIndexKeys < ActiveRecord::Migration[6.0]
  def change
    add_index :admins, :email, unique: true
    add_index :buildings, :position, unique: true
    add_index :statuses, :name, unique: true
    add_index :streets, :name, unique: true
    add_index :watchers, :email, unique: true
    add_index :sicknesses, :name, unique: true
  end
end
