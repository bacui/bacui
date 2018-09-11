class ActorsController < ApplicationController
  access instructor: :all, instructor_pending: :all, admin: :all, student: :all
  def new
    @actor = Actor.new
    @actor.task_id = params[:task_id]
  end

  def create
    # need actor name and task id
    @actor = Actor.new(actor_params)
    respond_to do |format|
      if @actor.save
        format.html {redirect_to({controller: "student_task", action: "list"}, notice: 'Team was successfully created.')}
      else
        format.html { render :new }
      end
    end
  end
end