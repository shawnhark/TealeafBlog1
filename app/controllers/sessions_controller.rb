class SessionsController <ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = @user_id
			flash[:notice] = "You are now logged in."
			redirect_to root_path
		else
			flash[:error] = "Sorry, something is wrong with user name or password."
			redirect_to login_path
		end
	end

	def destory
		session[:user_id] = nil
		flash[:notice] = "You are now logged out."
		redirect_to root_path
	end

end