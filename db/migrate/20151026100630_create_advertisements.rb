class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :name
      t.string :purchase_url
      t.integer :cover_image_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
