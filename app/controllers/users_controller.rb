class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      flash[:notice] = "Successfully Saved, yo!"
      redirect_to root_path
    else
      flash[:notice] = "Invalid Form"
      render "new"
    end
  end
end