class AddQtypeToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :qtype, :string
  end
end
