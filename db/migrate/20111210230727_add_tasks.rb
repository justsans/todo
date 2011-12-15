class AddTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :complete, :boolean, :default => 0
    add_column :tasks, :due_date, :datetime
  end

  def down
    remove_column :tasks, :complete, :due_date
  end
end
