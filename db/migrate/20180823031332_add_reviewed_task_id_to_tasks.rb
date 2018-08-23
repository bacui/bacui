class AddReviewedTaskIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :reviewed_task_id, :bigint
  end
end
