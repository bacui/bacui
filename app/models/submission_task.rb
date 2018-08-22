class SubmissionTask < Task
  validates_presence_of :title, :course_id
  belongs_to :course

end
