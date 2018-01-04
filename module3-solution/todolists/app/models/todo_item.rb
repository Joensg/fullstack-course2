class TodoItem < ActiveRecord::Base
  def self.get_count_of_completed_todo_items
    TodoItem.where(completed: true).count
  end
end
