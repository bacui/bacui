class AddActorReferenceToReviewMapping < ActiveRecord::Migration[5.2]
  def change
    add_reference :review_mappings, :assessor_actor, index: true
    add_foreign_key :review_mappings, :actors, column: :assessor_actor_id
  end
end
