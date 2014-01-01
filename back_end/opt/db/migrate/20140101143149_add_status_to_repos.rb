class AddStatusToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :status, :integer
  end
end
