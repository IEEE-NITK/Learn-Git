class AddColumnsToRepos < ActiveRecord::Migration
  def change
    add_column :repos,:course_id,:integer
  end
end
