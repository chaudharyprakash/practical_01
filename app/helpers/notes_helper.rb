module NotesHelper
	def tags_data(obj)
		obj.tags.present? ? obj.tags.pluck(:name).join('<br>') : '-'
	end
end
