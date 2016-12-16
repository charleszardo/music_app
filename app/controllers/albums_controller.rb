class AlbumsController < ApplicationController
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
      flash[:errors] = @album.errors.full_messages
      redirect_to new_album_url
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
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url(@album)
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
      flash[:errors] = @album.errors.full_messages
      redirect_to album_url(@album)
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :band_id, :album_type)
  end
end
