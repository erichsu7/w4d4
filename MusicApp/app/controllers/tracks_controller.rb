class TracksController < ApplicationController
  before_action :redirect_if_logged_out

  def show
    @track = Track.find(params[:id])
    @album = @track.album
    @notes = @track.notes.sort.reverse
  end

  def new
    @track = Track.new
    @album = Album.find(params[:album_id])

    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      @album = @track.album
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album

    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @album = @track.album

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    @track.delete
    redirect_to album_url(album)
  end

  private

    def track_params
      params.require(:track).permit(:title, :album_id, :track_number, :track_type, :lyrics)
    end
end
