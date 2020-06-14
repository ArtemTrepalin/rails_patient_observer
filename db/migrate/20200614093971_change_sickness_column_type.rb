class ChangeSicknessColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :sickness, :text
  end
end
