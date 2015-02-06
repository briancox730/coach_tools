class AddBodyRatioToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :body_weight_ratio, :float, default: 0
  end
end
