class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :user_id, null: false
      t.integer :wod_id, null: false
      t.integer :workout_id, null: false
      t.integer :performance, null: false
      t.timestamps
    end
  end
end
