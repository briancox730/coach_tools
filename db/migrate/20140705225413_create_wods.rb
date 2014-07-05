class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.date :date
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
