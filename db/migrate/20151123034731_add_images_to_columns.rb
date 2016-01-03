class AddImagesToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :image_ids, :integer, array: true, default: []
  end
end
