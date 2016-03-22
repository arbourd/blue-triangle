class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :course_id
      t.integer :member_id
      t.date :date

      t.timestamps null: false
    end

    add_index :reservations, :date
  end
end
