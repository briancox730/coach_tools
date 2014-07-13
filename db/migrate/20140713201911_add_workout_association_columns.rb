class AddWorkoutAssociationColumns < ActiveRecord::Migration
  def change
    add_column :workouts, :movement, :integer
    add_column :workouts, :workout_id, :integer

    create_table :movements do |t|
      t.string :name, null: false
    end
    add_index :movements, :name, unique: true
  end
end
