class FixMovementName < ActiveRecord::Migration
  def change
    remove_column :workouts, :movement
    add_column :workouts, :movement_id, :integer
  end
end
