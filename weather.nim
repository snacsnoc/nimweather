# weather
import json, httpclient, parseopt2


var
  opt = initOptParser()
  key: TaintedString


# Get next command line argument
next opt

# If no location is supplied, exit
if opt.key == nil:
    stdout.write("No location supplied!\n")
    quit()

let location: string = opt.key

# Get weather from Open Weather Map
let weather_json: string = getContent("http://api.openweathermap.org/data/2.5/weather?q="&location&"&units=metric")


let weather_info = parseJson(weather_json)
assert (weather_info.kind == JObject)

# Yay weather!
echo ("Current weather: ", $weather_info["main"]["temp"], "C. Humidity: ", $weather_info["main"]["humidity"], "%")