class Task < ApplicationRecord
  validates_presence_of :title, :num_reviewed_artifacts, :team_size
  belongs_to :course
end
