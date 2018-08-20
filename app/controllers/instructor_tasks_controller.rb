class InstructorTasksController < ApplicationController
  access instructor: [:list], instructor_pending: [:list], admin: :all

  def list
    @courses = Course.where instructor_id: current_user.id
  end
end
