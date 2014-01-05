class ChangeTeamsTable < ActiveRecord::Migration
  def change
    remove_column :teams,:ordera
    remove_column :teams,:orderb
    add_column :repos,:order,:text
  end
end
