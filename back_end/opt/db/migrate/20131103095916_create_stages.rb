class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
        t.integer "course_id"
        t.integer "step_number"
        t.string "objective"
        t.text "pbody"
        t.text "hints"
        t.text "references"
        t.text "useful_links"
        t.string "commit_number"
        t.text "extras"
        t.text "validation"
      t.timestamps
    end
  end
end
