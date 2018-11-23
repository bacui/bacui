class AdminPanelController < ApplicationController

  def users
    @users = User.order('users.roles ASC').all.paginate(:page => params[:page], :per_page => 5)
  end

  def pending_instructors
  end
end
