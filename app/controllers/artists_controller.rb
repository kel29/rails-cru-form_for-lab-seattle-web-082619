class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to @artist
  end

  def show
    set_artist
  end

  def edit
    set_artist
  end
  
  def update
    set_artist
    @artist.update(artist_params)
    redirect_to @artist
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

end
