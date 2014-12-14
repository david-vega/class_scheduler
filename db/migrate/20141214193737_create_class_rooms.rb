class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
