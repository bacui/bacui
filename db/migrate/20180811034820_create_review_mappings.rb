class CreateReviewMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :review_mappings do |t|

      t.timestamps
    end
  end
end
