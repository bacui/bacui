class SubmissionTask < Task
  validates_presence_of :title, :course_id
  belongs_to :course
  has_many :review_tasks, class_name: "ReviewTask", foreign_key: "reviewed_task_id"

  def self.model_name
    Task.model_name
  end
end
