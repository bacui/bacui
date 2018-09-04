class StudentTasksController < ApplicationController
  access student: [:list], admin: :all

  def list
    @courses = current_user.courses
  end
end
