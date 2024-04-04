class User < ApplicationRecord
    
has_many :user_groups
has_many :groups, through: :user_groups
has_many :user_games
has_many :games, through: :user_games


end
