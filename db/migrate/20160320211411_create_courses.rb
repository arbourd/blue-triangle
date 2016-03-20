class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: true
      t.integer :slots, null: false

      t.timestamps null: false
    end
  end
end
