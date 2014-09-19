class AddImageUrlToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :image_url, :string
  end
end
