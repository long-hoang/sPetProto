class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.time :time
      t.date :date
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
    add_index :plans, [:user_id, :course_id]
    add_index :plans, :course_id
  end
end
