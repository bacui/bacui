class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :instructor, :student, :instructor_pending], multiple: false)   ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :email

  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :actors_users
  has_many :actors, through: :actors_users

  def actor_by_task(task_id, type)
    # Argument "type" can be either Author or Reviewer
    # Returns an actor obj. if the user is a member of an actor of the task with the specified type,
    # otherwise return nil
    self.actors.each do |actor|
      if actor.is_a? type and actor.task_id == task_id
        return actor
      end
    end
    return nil
  end
end
