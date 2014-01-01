class AddColumnsToUsers1 < ActiveRecord::Migration
  def change
    add_column :users, :repo_id, :integer
    add_column :users, :team_id, :integer
  end
end
