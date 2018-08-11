class AddQuestionReferenceToCritique < ActiveRecord::Migration[5.2]
  def change
    add_reference :critiques, :question, foreign_key: true
  end
end
