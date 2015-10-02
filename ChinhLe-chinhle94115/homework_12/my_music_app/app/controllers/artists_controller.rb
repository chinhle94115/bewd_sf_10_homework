class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = get_artist
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    end
  end

  def edit
    @artist = get_artist
  end

  def update
    @artist = get_artist
    if @artist.update(artist_params)
      redirect_to artists_path(@artist)
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end


  private

  def artist_params
    params.require(:artist).permit(:name, :image_url, :description)
  end

  def get_artist
    Artist.find(params[:id])
  end
end
