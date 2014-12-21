class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name, unique: true
      t.string :state

      t.timestamps
    end
  end
end
