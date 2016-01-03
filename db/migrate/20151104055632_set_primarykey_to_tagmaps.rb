class SetPrimarykeyToTagmaps < ActiveRecord::Migration
  def change
    add_index :column_tags, [:tag_id, :column_id], unique: true
    add_index :course_tags, [:tag_id, :course_id], unique: true
  end
end
