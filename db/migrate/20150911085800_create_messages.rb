class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :content
      t.boolean :has_been_read, default: false
      t.integer :type

      t.timestamps null: false
    end
  end
end
