class FixBirthDayColumnAndAddTitleToDiet < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :birthday, :date
    add_column :diets, :title, :string
  end
end
