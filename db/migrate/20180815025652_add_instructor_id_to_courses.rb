class AddInstructorIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :instructor, index: true
    add_foreign_key :courses, :users, column: :instructor_id
  end
end
