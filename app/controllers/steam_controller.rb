class SteamController < ApplicationController

    require "rest-client"

    def index 
        response = "Hello from the Steam controller"
        render json: {response: response}
    end


    def test_query
        url = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_KEY']}&steamids=#{ENV['MY_ID']}"
        # url = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_KEY']}&steamids=#{ENV['MY_ID']}/friends"
        # url = "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{ENV['STEAM_KEY']}&steamid=#{ENV['MY_ID']}&relationship=friend" -- gives error
        response = RestClient.get(url)
        parsed_response = JSON.parse(response)
        render json:{response: parsed_response}
    end

    def env_test
        env_variable = ENV['MY_ID']
        render json: {response: env_variable}
    end
end
