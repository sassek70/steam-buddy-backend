class SteamController < ApplicationController
    require "rest-client"
    require "json"
    
    

    def index 
        response = "Hello from the Steam controller"
        render json: {response: response}
    end


    def test_query
        # NOT WORKING PROPERLY. STEAMS SENDS BACK HTML NOT JSON
        url = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_KEY']}&steamids=#{ENV['MY_ID']}"
        # url = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_KEY']}&steamids=#{ENV['MY_ID']}/friends"
        # url = "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{ENV['STEAM_KEY']}&steamid=#{ENV['MY_ID']}&relationship=friend" -- gives error
        response = RestClient.get(url)
        # parsed_response = JSON.parse(response)
        # render json:{response: parsed_response}
        render json:{response: response}
    end

    def store_search
        found_search_results = Array.new()
        # search_term = params[:_json]
        # url = "https://store.steampowered.com/search/?term=#{search_term}/supportedlang=english"
        url = "https://api.steampowered.com/ISteamApps/GetAppList/v2/"
        steam_list = RestClient.get(url)
        steam_list_parsed = JSON.parse(steam_list)

        # if steam_list_parsed.dig(:applist, :applist)
        
        # search_result = steam_list.map(&:values).select{ |appid, values| values["name"] == %w[grand theft auto]}
        # render json: {response: steam_list["applist"]["apps"].select(:name, "warhammer")}
        steam_list_parsed.each do |applist, app|
            if app.include?(:name, "warhammer") 
                found_search_results.insert(app)
            end
        end

        render json:{response: found_search_results}
        # render json:{response: steam_list_parsed}
            
        # puts steam_list_parsed.response

        # puts steam_list_parsed.dig(&:values).select{ |appid, values| values["name"] == %w[grand theft auto]}
        
        # render json:{response: steam_list}
        # render json:{response: steam_list.to_json()}
        # puts "the full url is: #{url}"
    end

    def env_test
        env_variable = ENV['MY_ID']
        render json: {response: env_variable}
    end

    private

    def search_params
        params.permit(:search_term)
    end
    
end
