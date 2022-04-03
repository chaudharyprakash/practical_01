class NotesController < ApplicationController
	before_action :find_note, only: %i[edit update destroy]

  def new
    @note = Note.new
  end

  def create
    note = current_user.notes.new(note_params)
    if note.save
      redirect_to notes_path, notice: 'Note was successfully created.'
    else
      redirect_to notes_path, alert: get_error_messages(note).to_s
    end
  end

  def index
    @tags = Tag.all
  end

  def edit; end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: 'Note was successfully updated.'
    else
      redirect_to notes_path, alert: get_error_messages(@tax).to_s
    end
  end

  def destroy
    if @note.destroy
      redirect_to notes_path, notice: 'Note was successfully deleted.'
    else
      redirect_to notes_path, alert: get_error_messages(@tax).to_s
    end
  end

  def note_permissions
    note_permission = NotePermission.find_or_create_by(user_id: params[:user_id], note_id: params[:note_id])
    note_permission.update(permission_params)
    redirect_to notes_path, notice: 'Permission successfully created.'
  end

  private

  def find_note
    @note = Note.find_by(id: params[:id])
    redirect_to notes_path, alert: 'Note was not found.' unless @note.present?
  end

  def note_params
    params.require(:note).permit(Note::PERMITTED_PARAMS)
  end

  def permission_params
    params.permit(:viewable, :editable, :deletable)
  end
end
