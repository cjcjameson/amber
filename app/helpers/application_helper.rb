module ApplicationHelper
  def logged_in?
    session[:id] ?  @user = User.find(session[:id]) : false
  end
end
