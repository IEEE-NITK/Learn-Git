class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
        t.string "objective"
        t.string "problem"
        t.string "prerequisites"
        t.string "author"
        t.float "rating"
        t.string "references"
        t.string "useful_materials"
        t.integer "mcount"
      t.timestamps
    end
  end
end
