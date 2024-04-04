p "reset seed db"

User.destroy_all
Group.destroy_all
Game.destroy_all
UserGroup.destroy_all
GroupGame.destroy_all
UserGame.destroy_all



p "Seed db reset"

p "Starting... Generate primary tables"

p "Generating users"

created_users = 0
until created_users == 10 do
    user = Faker::Name.first_name
    User.create(username: user, user_email: "#{user}@test.com", password: "test1234")
    created_users += 1
end

p "Users created successfully"

p "Generating games"

created_games = 0
until created_games == 20 do
    game = Faker::Game.title
    Game.create(game_name: game, steam_game_id: rand(1000...5000))
    created_games += 1
end

p "Games created successfully"

created_groups = 0
until created_groups == 5 do
    leader = User.all.sample
    Group.create(group_name: "#{leader}'s group", group_leader: leader.id, group_creator: leader.id, total_users: rand(1..10), is_public: [true,false].sample)
    created_groups += 1
end

p "Groups created successfully"

p "Primary tables generated"

p "Generating secondary tables"

p "Generating user groups"

user_groups = 0 
until user_groups == 10 do
    group = Group.all.sample
    UserGroup.create(group_id: group.id, group_member_id: User.all.sample.id)
    user_groups += 1
end

p "User groups created successfully"

p "Generating user games"

user_games = 0
until user_games == 50 do
    UserGame.create(user_id: User.all.sample.id, game_id: Game.all.sample.id)
    user_games += 1
end

p "User games created successfully"

p "Generating group games"

group_games = 0
until group_games == 30 do 
    group = Group.all.sample
    added_by_user = User.all.sample
    user_game = User
    GroupGame.create(group_id: group.id, user_game_id: UserGame.find_by!(user_id: added_by_user.id), game_added_by_user: added_by_user.username, date_added: :date)
    group_games += 1
end

p "Group games created successfully"

p "Secondary tables generated"

p "Seeding complete"
