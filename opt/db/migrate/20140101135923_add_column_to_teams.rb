class AddColumnToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :ordera, :text
    add_column :teams, :orderb, :text
  end
end
