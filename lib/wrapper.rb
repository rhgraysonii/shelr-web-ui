require 'sinatra'
require_relative 'shelr'

get '/' do
  content_type :txt
  Shelr.wrapper.help
end

get '/play_last' do
  content_type :txt
  Shelr.wrapper.play
end
