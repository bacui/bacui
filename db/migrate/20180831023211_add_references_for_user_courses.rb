class AddReferencesForUserCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_courses, :user, foreign_key: true
    add_reference :user_courses, :course, foreign_key: true
  end
end
