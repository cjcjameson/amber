class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_username(params[:username])
    if @user
      session[:id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid Username or Password"
      render "new"
    end
  end

  def exit
    reset_session
    redirect_to root_path
  end
end