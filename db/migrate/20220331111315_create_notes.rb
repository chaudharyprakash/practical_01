class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.string :tag_ids, array: :true, default: []
      t.timestamps
    end
  end
end
