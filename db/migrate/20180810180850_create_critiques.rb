class CreateCritiques < ActiveRecord::Migration[5.2]
  def change
    create_table :critiques do |t|
      t.text :comment
      t.integer :score

      t.timestamps
    end
  end
end
