class AddTitleToPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :title, :string
    add_column :plans, :category, :text
    add_index :plans, :title
    add_index :plans, :category
  end
end
