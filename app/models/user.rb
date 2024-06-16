class User < ApplicationRecord

validates :username, uniqueness: true
validates :password, presence: true, length: {minimum: 6}, allow_nil: true

has_many :user_groups
has_many :groups, through: :user_groups
has_many :user_games
has_many :games, through: :user_games
has_secure_password

def created_groups
    groups = Group.where(group_creator: self.id)
    groups
end

def group_leader
    groups = Group.where(group_leader: self.id)
end


end
