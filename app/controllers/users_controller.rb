class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:notice] = "You have now registered successfully. Please log in."
      redirect_to root_path
    else
      flash[:error] = "Unable to register you account. Please try again."
      render :new
    end
  end

  def show
  end


private
  def users_params
    params.require(:user).permit(:username, :password, :time_zone, :role)
  end


end
