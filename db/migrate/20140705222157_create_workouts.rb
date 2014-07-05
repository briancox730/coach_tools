class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.text :description, null: false
      t.integer :wtype_id, null: false
    end
  end
end
