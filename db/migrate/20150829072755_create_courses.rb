class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :video_url
      t.string :audio
      t.integer :level

      t.timestamps null: false
    end
  end
end
