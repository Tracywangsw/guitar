class AddCoverImageIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :cover_image_id, :integer
  end
end
