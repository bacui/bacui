class ActorsUser < ApplicationRecord
  belongs_to :user
  belongs_to :actor
  validates :user_id, uniqueness: { scope: [:user_id, :actor_id] }
end
