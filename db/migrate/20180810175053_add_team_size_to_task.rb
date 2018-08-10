class AddTeamSizeToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :team_size, :integer, default: 1
  end
end
