class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes
  has_many :note_permissions

  def related_notes_ids
    related_notes_ids = self.notes.ids
    related_notes_ids << self.note_permissions.where("viewable OR editable OR deletable").pluck(:note_id)
    related_notes_ids.flatten
  end
end
