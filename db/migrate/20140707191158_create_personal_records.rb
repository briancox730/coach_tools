class CreatePersonalRecords < ActiveRecord::Migration
  def change
    create_table :personal_records do |t|
      t.integer :user_id, null: false
      t.integer :back_squat
      t.integer :front_squat
      t.integer :overhead_squat
      t.integer :clean
      t.integer :snatch
      t.integer :power_clean
      t.integer :power_snatch
      t.integer :hang_clean
      t.integer :hang_snatch
      t.integer :split_jerk
      t.integer :push_jerk
      t.integer :push_press
      t.integer :press
      t.integer :dead_lift
    end
  end
end
