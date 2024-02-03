class SteamController < ApplicationController

    # require "rest-client"

    def index 
        response = "Hello from the Steam controller"
        render json: {response: response}
    end


    def test_query
        url = `http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV[`STEAM_KEY`]}&steamids=#{ENV[`MY_ID`]}`
        response = RestClient.get(url)
        parsed_response = JSON.parse(response)
        render json:{response: parsed_response}

    end
end
