class ReviewTask < Task
  validates_presence_of :title, :course_id, :num_reviewed_artifacts
  belongs_to :course
  belongs_to :submission_task, class_name: "SubmissionTask"
end