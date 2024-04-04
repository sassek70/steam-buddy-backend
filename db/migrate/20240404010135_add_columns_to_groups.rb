class AddColumnsToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :group_creator, :integer
    add_column :groups, :total_users, :integer
    add_column :groups, :is_public, :bool, default: false
  end
end
