class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    @note.save
    redirect_to track_url(@note.track)
  end

  def destroy
    @note = Note.find(params[:id])
    track = @note.track
    @note.delete
    redirect_to track_url(track)
  end

  private

    def note_params
      params.require(:note).permit(:track_id, :body)
    end
end
