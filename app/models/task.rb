class Task < ActiveRecord::Base
  def self.get_high_tasks
    Task.find_all_by_priority_and_complete(1, false);
  end
  def self.get_medium_tasks
    Task.find_all_by_priority_and_complete(2, false);
  end
  def self.get_low_tasks
    Task.find_all_by_priority_and_complete(3, false);
  end
  def self.get_done_tasks
    Task.find_all_by_complete(true);
  end
end
