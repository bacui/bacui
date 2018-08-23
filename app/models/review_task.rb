class ReviewTask < Task
  validates_presence_of :title, :course_id, :num_reviewed_artifacts, :reviewed_task_id
  belongs_to :course
  belongs_to :submission_task, class_name: "SubmissionTask", foreign_key: "reviewed_task_id"

  def self.model_name
    Task.model_name
  end
end