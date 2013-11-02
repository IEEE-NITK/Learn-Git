class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.float :status
      t.string :name

      t.timestamps
    end
  end
end
