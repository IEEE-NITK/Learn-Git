class AddColumnToCourses1 < ActiveRecord::Migration
  def change
    add_column :courses, :url, :string
  end
end
