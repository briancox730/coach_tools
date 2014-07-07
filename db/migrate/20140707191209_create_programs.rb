class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name, null: false
    end
    add_index :programs, :name, unique: true
  end
end
