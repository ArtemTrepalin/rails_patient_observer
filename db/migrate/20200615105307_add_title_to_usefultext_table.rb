class AddTitleToUsefultextTable < ActiveRecord::Migration[6.0]
  def change
    add_column :useful_texts, :title, :string
  end
end
