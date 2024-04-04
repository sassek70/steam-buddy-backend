class AddUserTableColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password, :string
    add_column :users, :last_login, :datetime
    add_column :users, :total_games, :integer, default: 0
    add_column :users, :total_groups, :integer, default: 0
    add_column :users, :is_online, :bool, default: false

  end
end
