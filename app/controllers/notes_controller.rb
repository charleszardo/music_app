class NotesController < ApplicationController
  before_action :require_login

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
    fail
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
