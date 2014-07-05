class CreateWtype < ActiveRecord::Migration
  def change
    create_table :wtypes do |t|
      t.string :type, null: false
    end
    add_index :wtypes, :type, unique: true
  end
end
