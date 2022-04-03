class Note < ApplicationRecord
	ACTIONS = %i[viewable editable deletable]
	PERMITTED_PARAMS = [:id, :title, :description, tag_ids: []]

	has_many :taggings
	has_many :note_permissions
  has_many :tags, through: :taggings

  belongs_to :user


  def applicable_actions(current_user_id)
  	return ACTIONS if self.user_id == current_user_id
  	user_note_permission = self.note_permissions.find_by(user_id: current_user_id)
  	return [] if user_note_permission.blank?
  	ACTIONS.select{|action| user_note_permission.send(action)}
  end
end
