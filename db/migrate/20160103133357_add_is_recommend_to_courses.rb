class AddIsRecommendToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :is_recommend, :bool, default: false
  end
end
