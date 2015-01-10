class AlbumsController < ApplicationController
  before_action :redirect_if_logged_out
  
  def show
    @album = Album.find(params[:id])
    @band = @album.band
    @tracks = @album.tracks.order(:track_number)

    render :show
  end

  def new
    @album = Album.new
    @band = Band.find(params[:band_id])

    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      @band = @album.band
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band

    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @band = @album.band

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band = @album.band
    @album.delete
    redirect_to band_url(band)
  end

  private

    def album_params
      params.require(:album).permit(:name, :band_id, :genre, :year, :album_type)
    end
end
