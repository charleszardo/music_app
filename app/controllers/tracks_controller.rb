class TracksController < ApplicationController
  before_action :require_login
  before_action :require_owner, only: [:edit, :update, :destroy]

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
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    if @track.destroy
      redirect_to album_url(album)
    else
      render :show
    end
  end

  def show
    @track = Track.includes(:notes => [:author]).find(params[:id])
    @note = Note.new

    render :show
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :track_type, :lyrics)
  end
end
