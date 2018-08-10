class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :description
      t.float :weight
      t.float :min_score
      t.float :max_score

      t.timestamps
    end
  end
end
