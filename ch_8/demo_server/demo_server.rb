require 'sinatra'

get '/' do
  "This is an endpoint for Chapter 8 of the <a href='http://iconoclastlabs.github.com/rubymotion_cookbook/'>Rubymotion Cookbook</a> to demonstrate network requests."
end
# Chapter 8.5
get '/get' do
  response = "GET request, with params: "
  params.each{|param| response += "#{param} "}
  response
end
# Chapter 8.6
post '/post' do
  response = "POSTed to the server with params:"
  params.each{|param| response += "#{param} "}
  response
end
# Chapter 8.8
put '/put' do
  response = "Successfully PUT something"
  params.each{|param| response += "#{param} "}
  response
end
# Chapter 8.7
delete '/delete' do
  response = "DELETEd something"
  params.each{|param| response += "#{param} "}
  response
end
