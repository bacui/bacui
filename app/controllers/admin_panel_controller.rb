class AdminPanelController < ApplicationController

  def users
    @users = User.order('users.roles ASC').all.paginate(:page => params[:page], :per_page => 5)
  end

  def pending_instructors
    @pending_instructors = User.where(:roles => :instructor_pending).paginate(:page => params[:page], :per_page => 5)
  end

  def approve_pending_instructor
    respond_to do |format|
      user = User.find(params[:id])
      user.roles = 'instructor'
      user.save
      format.html { redirect_to({ controller: "admin_panel", action: "pending_instructors" }, notice: 'Approved!') }
    end
  end
end
