module ApplicationHelper
  def flash_class(level)
     case level
     when :notice then "alert alert-info"
     when :success then "alert alert-success"
     when :error then "alert alert-danger"
     when :alert then "alert alert-danger"
     end
  end

  def generate_conversation_for_user user
    if current_user.conversation_exists?(user)
      
    else
    end
  end
end
