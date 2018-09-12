class ActorsController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
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
        ActorsUser.create(actor_id: @actor.id, user_id: current_user.id)
        format.html {redirect_to({controller: "student_tasks", action: "list"}, notice: 'Team was successfully created.')}
      else
        format.html { render :new }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_actor
    @actor = Actor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def actor_params
    params.require(:actor).permit(:title, :task_id)
  end
end