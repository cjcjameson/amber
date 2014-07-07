class UsersController < ApplicationController
  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      render "new", :layout => false
    end
  end
end