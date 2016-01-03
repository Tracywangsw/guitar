class AddCoverImageIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :cover_image_id, :integer
  end
end
