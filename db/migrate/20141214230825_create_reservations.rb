class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :state
      t.integer :user_id
      t.integer :classroom_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
