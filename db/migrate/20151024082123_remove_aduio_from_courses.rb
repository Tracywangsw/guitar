class RemoveAduioFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :audio
  end
end
