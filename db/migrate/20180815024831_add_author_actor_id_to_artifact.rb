class AddAuthorActorIdToArtifact < ActiveRecord::Migration[5.2]
  def change
    add_reference :artifacts, :author_actor, index: true
    add_foreign_key :artifacts, :actors, column: :author_actor_id
  end
end
