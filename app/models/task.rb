class Task < ApplicationRecord
  validates_presence_of :title, :course_id
  belongs_to :course
  validates :team_size, :inclusion => 1..10

end
