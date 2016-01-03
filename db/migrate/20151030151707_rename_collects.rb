class RenameCollects < ActiveRecord::Migration
  def change
    rename_column :users, :collects, :course_collects
  end
end
