class InstructorTasksController < ApplicationController
  access instructor: [:list], instructor_pending: [:list], admin: :all

  def list
    
  end
end
