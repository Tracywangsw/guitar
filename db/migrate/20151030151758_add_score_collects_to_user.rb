class AddScoreCollectsToUser < ActiveRecord::Migration
  def change
    add_column :users, :score_collects, :integer, array: true, default: []
  end
end
