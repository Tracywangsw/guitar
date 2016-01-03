class AddAudioIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :audio_id, :integer
  end
end
