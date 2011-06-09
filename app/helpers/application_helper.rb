module ApplicationHelper
  
  def current_user
    begin
      User.find session[:user_id]
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
  
end
