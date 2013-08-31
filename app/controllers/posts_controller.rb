class PostsController < ApplicationController
	before_action :set_post, only: [:show, :update, :edit, :vote] 
	before_action :require_user, only: [:new, :create, :edit, :update, :vote]
	before_action :require_creator_or_admin, only: [:edit, :update]

  def index
  	@posts = Post.all
  end

  def show
    respond_to do |format|
      format.html { @comment = Comment.new }
      format.json {render json: @post}
    end
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

  def vote
    @vote = Vote.new(voteable: @post, creator: current_user, vote: params[:vote])
    @vote.save

    respond_to do |format|
      format.html do
        flash[:notice] = "Your vote was counted."
        redirect_to :back
      end

      format.js

    end
  end

	private
	def post_params
	  params.require(:post).permit(:title, :url, :description)
	end

	def set_post
		@post = Post.find_by(slug: params[:id])
	end

  def require_creator_or_admin
  	access_denied unless logged_in? && (@post.creator == current_user || current_user.admin?)
  end
  
end


#	def destroy
#		@post.destroy
#		respond_to do |format|
#			format.html { redirect_to posts_url }
#			format.json { head :no_content }
#		end 
#	end
