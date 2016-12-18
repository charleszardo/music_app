class NotesController < ApplicationController
  before_action :require_login
  before_action :require_owner, only: [:update, :destroy]

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    if @note.save
      redirect_to track_url(@note.track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track)
    end
  end

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(note_params)
      redirect_to track_url(@note.track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track)
    end
  end

  def destroy
    @note = Note.find(params[:id])

    if @note.destroy
      redirect_to track_url(@note.track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track)
    end
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end

  def require_owner
    note = Note.find(params[:id])
    unless note.is_owner?(current_user)
      redirect_to root_url
    end
  end
end
