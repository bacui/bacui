class CreateJoinTableActorsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :actors, :users do |t|
      t.index :user_id
      t.index :actor_id
    end
  end
end
