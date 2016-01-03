class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :name
      t.integer :images, array: true, default: []
      t.string :description
      t.belongs_to :course, index: true

      t.timestamps null: false
    end
  end
end
