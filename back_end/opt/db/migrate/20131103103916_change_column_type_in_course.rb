class ChangeColumnTypeInCourse < ActiveRecord::Migration
  def change
    remove_column :courses,:author
    add_column :courses,:author_id,:integer
  end
end
