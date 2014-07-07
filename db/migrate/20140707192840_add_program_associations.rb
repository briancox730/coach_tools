class AddProgramAssociations < ActiveRecord::Migration
  def change
    add_column :users, :program_id, :integer, null: false
    add_column :wods, :program_id, :integer, null: false
  end
end
