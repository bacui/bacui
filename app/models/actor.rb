class Actor < ApplicationRecord
  belongs_to :task
  validates_presence_of :task_id
  has_many :actors_users
  has_many :users, through: :actors_users

  def full?
    task = Task.find(self.task_id)
    users = self.users
    users.size >= task.team_size
  end
end
