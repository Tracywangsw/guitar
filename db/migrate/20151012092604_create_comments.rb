class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :commenter, polymorphic: true, index: true
      t.boolean :is_blocked, default: false

      t.timestamps null: false
    end
  end
end
