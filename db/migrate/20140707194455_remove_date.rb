class RemoveDate < ActiveRecord::Migration
  def change
    remove_column :wods, :date
  end
end
