module ApplicationHelper
	def flash_class(level)
    case level
    when 'notice' then 'alert-success'
    when 'success' then 'alert-success'
    when 'error' then 'alert-error'
    when 'alert' then 'alert-error'
    end
  end

  def form_button_text
    case controller.action_name
    when 'new'
      'Save'
    when 'edit'
      'Update'
    else
      'Submit'
    end
  end
end
