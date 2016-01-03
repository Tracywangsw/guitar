class AddColumnToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :category, :integer
  end
end
