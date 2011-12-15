class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :priority
      t.integer :seconds

      t.timestamps
    end
  end
end
