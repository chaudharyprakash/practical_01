class CreateNotePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :note_permissions do |t|
      t.boolean :viewable, default: false
      t.boolean :editable, default: false
      t.boolean :deletable, default: false
      t.references :user, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
