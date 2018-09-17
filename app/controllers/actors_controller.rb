class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy, :add_member]
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

  def edit
  end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to({controller: "student_tasks", action: "list"}, notice: 'Team was successfully updated.') }
      else
        format.html { render :edit }
      end
    end
  end

  def add_member
    respond_to do |format|
      user_to_add = User.where(email: params[:user][:email]).first

      if user_to_add.nil?
        format.html { redirect_to({controller: "actors", action: "edit", id: @actor.id}, notice: "\"#{params[:user][:email]}\" does not exist") }
      elsif @actor.users.include?(user_to_add)
        format.html { redirect_to({controller: "actors", action: "edit", id: @actor.id}, notice: "\"#{params[:user][:email]}\" is already in your team") }
      elsif not Course.find(Task.find(@actor.task_id).course_id).users.include?(user_to_add)
        format.html { redirect_to({controller: "actors", action: "edit", id: @actor.id}, notice: "\"#{params[:user][:email]}\" is not enrolled in this course") }
      elsif not user_to_add.actor_by_task(@actor.task_id, SubmissionTask).nil?
        format.html { redirect_to({controller: "actors", action: "edit", id: @actor.id}, notice: "\"#{params[:user][:email]}\" is already in a team in this task") }
      else
        ActorsUser.create(actor_id: @actor.id, user_id: user_to_add.id)
      end



      format.html { redirect_to({controller: "actors", action: "edit", id: @actor.id}, notice: 'hahaha') }
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_actor
    @actor = Actor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def actor_params
    params.require(:actor).permit(:name, :task_id)
  end
end