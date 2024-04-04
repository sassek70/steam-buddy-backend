class AddUserGamesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :user_games do |t|
      t.integer :user_id
      t.integer :game_id
    end
  end
end
