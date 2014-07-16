class AddBodyweight < ActiveRecord::Migration
  def change
    add_column :personal_records, :body_weight, :integer
  end
end
