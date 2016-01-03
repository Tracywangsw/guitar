class AddColumnsToTables < ActiveRecord::Migration
  def change
    add_column :columns, :is_recommend, :bool, default: false
    add_column :advertisements, :description, :string
  end
end
