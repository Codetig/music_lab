require 'sinatra'
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

get '/artists/new' do
  erb :new_artist
end

get '/artists/:artist_id' do
  @artist = Artist.find_by(id: params[:artist_id])
  erb :show_artist
end

get '/artists/:artist_id/edit' do
  @artist = Artist.find_by(id: params[:artist_id])
  erb :edit_artist
end

#Posts
post '/artists' do
  artist= Artist.create(name: params[:name], solo: params[:solo], genre: params[:genre])
  artist.save
  redirect '/artists'
end

#Put & Delete

put '/artists/:artist_id' do
  artist = Artist.find_by(id: params[:artist_id])
  artist.update(name: params[:name], solo: params[:solo], genre: params[:genre])
  redirect "/artists/#{artist.id}"
end


delete '/artists/:artist_id' do
  artist = Artist.find_by(id: params[:artist_id])
  artist.destroy
  redirect '/artists'
end




