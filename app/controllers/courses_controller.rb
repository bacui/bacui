class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :list_users, :add_user]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.instructor_id = current_user.id
    respond_to do |format|
      if @course.save
        format.html {redirect_to({controller: "instructor_tasks", action: "list"}, notice: 'Course was successfully created.')}
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to({controller: "instructor_tasks", action: "list"}, notice: 'Course was successfully updated.') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to({controller: "instructor_tasks", action: "list"}, notice: 'Course was successfully destroyed.') }
    end
  end

  def list_users
    @users = @course.users
  end

  def add_user
    respond_to do |format|
      if @course.nil?
        format.html { redirect_to({controller: "instructor_tasks", action: "list"}, alert: 'Cannot find the courses.')}
      end

      begin
        user = User.find_by_email(params["user"]["email"])
        if (user.nil?)
          error_message = 'No user with email ' + params["user"]["email"] + ' is registered'
          raise "error"
        end

        user_course = UserCourse.where(user_id: user.id, course_id: @course.id)
        if (!user_course.empty?)
          error_message = 'User ' + user.first_name + ' ' + user.last_name + ' is already enrolled in the course.'
          raise "error"
        end

        instructor = User.find(@course.instructor_id)
        user_courses = UserCourse.where(course_id: @course.id)
        if (instructor.role == :instructor_pending && user_courses.length >= 10)
          error_message = 'A pending instructor can add only upto 10 students per course'
          raise "error"
        end

        user_course = UserCourse.new(user_id: user.id, course_id: @course.id)
        if (user_course.save)
          message = user.first_name + ' '+ user.last_name + ' has been added successfully.'
          format.html { redirect_to({controller: "courses", action: "list_users", id: @course.id}, notice: message ) }
        else
          error_message = user.first_name + ' '+ user.last_name + ' could not be added to the course due to internal error.'
          raise "error"
        end
      rescue
        format.html { redirect_to({controller: "courses", action: "list_users", id: @course.id}, alert: error_message) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title)
    end
end
