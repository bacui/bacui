class InstructorTasksController < ApplicationController
  access instructor: [:list], instructor_pending: [:list], admin: :all

  def list
    if logged_in?(:instructor,:instructor_pending)
      @courses = Course.where(instructor_id: current_user.id).order("id DESC")
    elsif logged_in?(:admin)
      @courses = Course.all.order("id DESC")
    end
  end
end
