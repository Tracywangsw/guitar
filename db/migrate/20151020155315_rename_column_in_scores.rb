class RenameColumnInScores < ActiveRecord::Migration
  def change
    rename_column :scores, :images, :image_ids
  end
end
