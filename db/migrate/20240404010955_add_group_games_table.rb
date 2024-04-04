class AddGroupGamesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :group_games do |t|
      t.integer :group_id
      t.integer :user_game_id
      t.integer :game_added_by_user
      t.date :date_added
    end
  end
end
