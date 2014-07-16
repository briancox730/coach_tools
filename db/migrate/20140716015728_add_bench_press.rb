class AddBenchPress < ActiveRecord::Migration
  def change
    add_column :personal_records, :bench_press, :integer
  end
end
