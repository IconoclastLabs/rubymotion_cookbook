require 'sinatra'

get '/' do
  "GET request received"
end

post '/' do
  "POSTed to the server"
end

put '/' do
  "Successfully PUT something"
end

delete '/' do
  "DELETEd something"
end
