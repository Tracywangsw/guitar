class CreatePhotoShows < ActiveRecord::Migration
  def change
    create_table :photo_shows do |t|
      t.string :description
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
