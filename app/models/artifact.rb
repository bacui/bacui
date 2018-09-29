class Artifact < ApplicationRecord
  belongs_to :actor
  validates_presence_of :task_id
  belongs_to :author_actor, class_name: "Actor", foreign_key: "author_actor_id"
end
