class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.boolean :is_admin, default: false
      t.boolean :is_frozen, default: false
      t.integer :admin_type
      t.integer :collects, array: true, default: []

      t.timestamps null: false
    end
  end
end
