class AddTaskReferenceToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :task, foreign_key: true
  end
end
