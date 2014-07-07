class RenameColumnWtype < ActiveRecord::Migration
  def change
    remove_column :workouts, :wtype_id
    add_column :workouts, :workout_type_id, :integer, null: false
  end
end
