class AddGamesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :game_name
      t.integer :steam_game_id
    end
  end
end
