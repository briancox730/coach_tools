class AddCleanAndJerk < ActiveRecord::Migration
  def change
    add_column :personal_records, :clean_and_jerk, :integer
  end
end
