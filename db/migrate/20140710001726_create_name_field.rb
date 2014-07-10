class CreateNameField < ActiveRecord::Migration
  def change
    add_column :workouts, :name, :string, null: false
  end
end
