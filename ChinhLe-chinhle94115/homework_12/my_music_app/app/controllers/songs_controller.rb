class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  def show
    @song = get_song
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    end
  end

  def edit
    @song = get_song
  end

  def update
    @song = get_song
    if @song.update(song_params)
      redirect_to songs_path(@song)
    else
      render 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path
  end


  private

  def song_params
    params.require(:song).permit(:title, :length, :genre, :artist_id)
  end

  def get_song
    Song.find(params[:id])
  end

end
