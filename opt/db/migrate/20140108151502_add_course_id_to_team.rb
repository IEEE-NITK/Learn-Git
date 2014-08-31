class AddCourseIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :course_id, :integer
  end
end
