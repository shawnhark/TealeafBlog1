class PostsController < ApplicationController
	before_action :set_post, only: [:show, :update, :edit] 
	before_action :require_user, only: [:new, :create, :edit, :update]
	before_action :require_creator, only: [:edit, :update]

  def index
  	@posts = Post.all
  end

  def show
  	@comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.creator = current_user

		if @post.save
			flash[:notice] = "You created a new post!"
			redirect_to posts_path
  	else

			render :new
  	end
	end
  	
 	def edit
	end

	def update
		if @post.update(post_params)
	  	flash[:notice] = "Post was successfully updated."
	    redirect_to post_path(@post)
	  else
	    render :edit
	  end
	end

	private
	def post_params
	  params.require(:post).permit(:title, :url)
	end

	def set_post
		@post = Post.find(params[:id])
	end

  def require_creator
  	access_denied unless @post.creator == current_user
  end
  
end


#	def destroy
#		@post.destroy
#		respond_to do |format|
#			format.html { redirect_to posts_url }
#			format.json { head :no_content }
#		end 
#	end
