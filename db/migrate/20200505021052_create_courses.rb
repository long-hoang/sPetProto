class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.text :category
      t.timestamps
    end
    add_index :courses, :user_id

  end
end
