module ApplicationHelper
  def logged_in?
    if session[:id]
      @user = User.find(session[:id])
      true
    else
      false
    end
  end
end
