class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :user_id, uniqueness: { scope: [:user_id, :course_id] }
end
