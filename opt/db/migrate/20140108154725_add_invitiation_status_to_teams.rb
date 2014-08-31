class AddInvitiationStatusToTeams < ActiveRecord::Migration
  def change
    add_column :teams,:acceptedInvites,:integer
  end
end
