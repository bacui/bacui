class InstructorTasksController < ApplicationController
  access instructor: [:list], admin: :all

  def list
    
  end
end
