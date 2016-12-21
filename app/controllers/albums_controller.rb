class AlbumsController < ApplicationController
  before_action :require_login
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @albums = Album.all

    render :index
  end

  def new
    @album = Album.new

    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])

    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])

    if @album.destroy
      redirect_to albums_url
    else
      render :show
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :band_id, :album_type)
  end
end
