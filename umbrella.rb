pp "Howdy"

pp "Where are uou located?"

 user_location = gets.chomp.gsub(" ", "%20")

# user_location = "Chicago"


pp user_location

maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

p maps_url

require "http"

resp = HTTP.get(maps_url)

raw_resp = resp.to_s

# pp raw_resp

require "json"

parsed_response = JSON.parse(raw_resp)

results = parsed_response.fetch("results")

first_result = results.at(0)

pp first_result.keys

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

pp latitude = loc.fetch("lat")
pp longitude = loc.fetch("lng")




# Hidden variables
pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_KEY")

# Assemble the full URL string by adding the first part, the API token, and the last part together
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "#{latitude},#{longitude}"

# Place a GET request to the URL
raw_response = HTTP.get(pirate_weather_url)

# require "json"

parsed_response = JSON.parse(raw_response)

pp parsed_response.fetch("message")

currently_hash = parsed_response.fetch("currently")

current_temp = currently_hash.fetch("temperature")

puts "The current temperature is " + current_temp.to_s + "."
