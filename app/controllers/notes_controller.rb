class NotesController < ApplicationController

  def index
    @notes = Note.all.order("created_at ASC").group_by(&:year)
  end

  def new
    admin_required
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      send_flash_alert('Note update was created!')
      redirect_to notes_path
    else
      render 'notes/new'
    end
  end

  def edit
    admin_required
    @note = Note.find_by(id: params[:id])
    return render_not_found if @note.blank?
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    if @note.save
      send_flash_alert('Note was updated!')
      redirect_to notes_path
    else
      render 'notes/edit'
    end
  end

  def destroy
    admin_required
    @note = Note.find_by(id: params[:id])
    @note.destroy
    send_flash_alert('Notes have been removed!')
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:note_update)
  end

end
