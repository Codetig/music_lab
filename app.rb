require 'Sinatra'
require 'pry'
require 'sinatra/activerecord'
require 'pg'
require './models/artist'

#Root
get '/' do
  redirect '/artists'
end

#Gets
get '/artists' do
  @artists = Artist.all
  erb :index
end

#Posts


#Put & Delete