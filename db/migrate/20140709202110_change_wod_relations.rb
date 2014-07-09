class ChangeWodRelations < ActiveRecord::Migration
  def change
    add_column :workouts, :wod_id, :integer, null: false
    remove_column :statistics, :wod_id
  end
end
