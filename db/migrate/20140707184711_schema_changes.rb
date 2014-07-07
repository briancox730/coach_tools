class SchemaChanges < ActiveRecord::Migration
  def change
    rename_table :wtypes, :workout_types
    add_column :statistics, :comment, :text
  end
end
