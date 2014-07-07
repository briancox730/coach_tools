class RenameTypeColumn < ActiveRecord::Migration
  def change
    add_column :wtypes, :name, :string, null: false
    add_index :wtypes, :name, unique: true
    remove_index :wtypes, name: :index_wtypes_on_type
    remove_column :wtypes, :type
  end
end
