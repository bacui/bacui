class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :num_reviewed_artifacts
      t.boolean :include_self_review
      t.boolean :archived

      t.timestamps
    end
  end
end
