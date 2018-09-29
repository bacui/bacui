class Artifact < ApplicationRecord
  validates_presence_of :author_actor_id
  belongs_to :author_actor, class_name: "Actor", foreign_key: "author_actor_id"
end
