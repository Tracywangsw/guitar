class AddCoverImageToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :cover_image_id, :integer
  end
end
