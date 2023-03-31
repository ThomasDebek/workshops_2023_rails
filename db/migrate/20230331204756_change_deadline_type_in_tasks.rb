class ChangeDeadlineTypeInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :deadline, :datetime
  end
end
