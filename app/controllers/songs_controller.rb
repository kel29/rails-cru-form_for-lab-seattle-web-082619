class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.save
    redirect_to @song
  end

  def show
    set_song
    @genre = @song.genre
    @artist = @song.artist
  end

  def edit
    set_song
  end
  
  def update
    set_song
    @song.update(song_params)
    redirect_to @song
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

end
