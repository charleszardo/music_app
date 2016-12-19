class BandsController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @bands = Band.all

    render :index
  end

  def new
    @band = Band.new

    render :new
  end

  def create
    @band = Band.new(band_params)
    @band.owner = current_user

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

    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def show
    @band = Band.includes(:albums).find(params[:id])

    render :show
  end

  def destroy
    @band = Band.find(params[:id])

    if @band.destroy
      redirect_to bands_url
    else
      render :show
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

  def require_owner
    band = Band.find(params[:id])
    unless band.is_owner?(current_user)
      redirect_to root_url
    end
  end
end
