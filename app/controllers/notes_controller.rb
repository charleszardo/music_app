class NotesController < ApplicationController
  before_action :require_login
  before_action :require_owner, only: [:update, :destroy, :edit]
  before_action :require_admin, only: [:create]

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save

    redirect_to track_url(@note.track)
  end

  def edit
    @note = Note.find(params[:id])

    render :edit
  end

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(note_params)
      redirect_to track_url(@note.track)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to track_url(@note.track)
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
