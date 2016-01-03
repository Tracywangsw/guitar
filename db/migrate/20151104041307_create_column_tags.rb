class CreateColumnTags < ActiveRecord::Migration
  def change
    create_table :column_tags do |t|
      t.integer :column_id
      t.integer :tag_id
      t.timestamps null: false
    end
  end
end
