class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user_save
      flash[:notice] = "You have now registered successfully. Please log in."
      redirect_to root_path
    else
      flash[:error] = "Unable to register you account. Please try again."
      render :new
    end
  end


private
  def users_params
    params.require(:user).permit(:username, :password)
  end


end
