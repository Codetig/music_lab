require 'sinatra'
require 'pry'
require 'sinatra/activerecord'
require 'pg'
require './models/music'

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

get '/artists/:artist_id/songs/new' do
  @artist = Artist.find_by(id: params[:artist_id])
  erb :new_song
end

get '/artists/:artist_id' do
  @artist = Artist.find_by(id: params[:artist_id])
  erb :show_artist
end

get '/artists/:artist_id/songs' do
  @artist = Artist.find_by(id: params[:artist_id])
  @songs = Song.where(artist_id: params[:artist_id])
  erb :show_songs
end

get '/artists/:artist_id/edit' do
  @artist = Artist.find_by(id: params[:artist_id])
  erb :edit_artist
end

get '/artists/:artist_id/songs/:song_id/edit' do
  @artist = Artist.find_by(id: params[:artist_id])
  @song = Song.find_by(id: params[:song_id])
  erb :edit_song

end

#Posts
post '/artists' do
  artist= Artist.create(name: params[:name], solo: params[:solo], genre: params[:genre])
  artist.save
  redirect '/artists'
end

post "/artists/:artist_id/songs" do
  song = Song.create(artist_id:params[:artist_id], title: params[:title])
  song.save
  redirect "/artists/#{song.artist_id}/songs"
end

#Put & Delete

put '/artists/:artist_id' do
  artist = Artist.find_by(id: params[:artist_id])
  artist.update(name: params[:name], solo: params[:solo], genre: params[:genre])
  redirect "/artists/#{artist.id}"
end

put "/artists/:artist_id/songs/:song_id" do
  song = Song.find_by(id: params[:song_id])
  song.update(title: params[:title])
  redirect "/artists/#{params[:artist_id]}/songs"
end

delete '/artists/:artist_id' do
  artist = Artist.find_by(id: params[:artist_id])
  artist.destroy
  redirect '/artists'
end

delete "/artists/:artist_id/songs/:song_id" do
  song = Song.find_by(id: params[:song_id])
  song.destroy
  redirect "/artists/#{params[:artist_id]}/songs"
end



