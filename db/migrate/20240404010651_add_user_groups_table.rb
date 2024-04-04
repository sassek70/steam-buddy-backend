class AddUserGroupsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.integer :group_id
      t.integer :group_member_id
    end
  end
end
