class AddAssesseeReferenceToReviewMapping < ActiveRecord::Migration[5.2]
  def change
    add_reference :review_mappings, :assessee_actor, index: true
    add_foreign_key :review_mappings, :actors, column: :assessee_actor_id
  end
end
