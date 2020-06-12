class AddIndexKeys < ActiveRecord::Migration[6.0]
  def change
    add_index :admins, :email, unique: true
    add_index :statuses, :name, unique: true
    add_index :watchers, :email, unique: true
  end
end
