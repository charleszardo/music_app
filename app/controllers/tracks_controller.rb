class TracksController < ApplicationController

  def new
    @track = Track.new

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

    render :new
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages

      redirect_to track_url(@track)
    end
  end

  def destroy
    @track = Track.find(params[:id])

    if @track.destroy
      redirect_to tracks_url
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to track_url(@track)
    end
  end

  def show
    @track = Track.find(params[:id])

    render :show
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :track_type, :lyrics)
  end
end
