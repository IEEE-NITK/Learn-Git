class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
