class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
    else
      flash[:notice] = "Invalid Username or Password"
    end
      redirect_to root_path
  end

  def exit
    reset_session
    redirect_to root_path
  end
end