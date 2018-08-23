class Course < ApplicationRecord
  validates_presence_of :title
  has_many :tasks

  def submission_tasks
    # found = []
    # for task in self.tasks
    #   if task.instance_of? SubmissionTask
    #     found << task
    #   end
    # end
    # found
    self.tasks.select {|task| task.instance_of? SubmissionTask}
  end
end
