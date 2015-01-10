class BandsController < ApplicationController
  before_action :redirect_if_logged_out
  
  def index
    @bands = Band.order(:name)

    render :index
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums.order(:year)

    render :show
  end

  def new
    @band = Band.new

    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])

    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_url
  end

  private

    def band_params
      params.require(:band).permit(:name)
    end
end
