class PostsController < ApplicationController
before_action :set_post, only: [:show, :update, :destroy]

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@posts = Post.new
  end

  def create
#  	@post = Post.new(post_params)
#
# 	respond_to do |format|
#		  if @post.save
#  			format.html { redirect_to @post, notice: 'Post was successfully created.'}
#  			format.json { render action: 'show', status: :created, location: @post }
#  		else
#  			format.html { redner action: 'new'}
#				format.json { render json: @post.errors, status: :unprocessable_entity }
#			end
#		end

  	post = Post.new(params.require(:post).permit!)

  	if @post.save
  		flash[:notice] = "You created a new post!"
  		redirect_to posts_path
  	else

  		render
  	end
  end
  	
 	def edit
	  @post = Post.find(params[:id])
	end

	def update
#		respond_to do |format|
#			if @post.update(post_params)
#				format.htms { redirect_to @post, notice: 'Post was successfully updated.'}
#				format json { head :no_content }
#			else
#				format.html { render action: 'edit' }
#				format.json { render json: @post_errors, status: :unprocessable_entity }
#			end
#
	  @post = Post.find(params[:id])
	 
	  if @post.update(params[:post].permit(:title, :text))
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def destroy
#		@post.destroy
#		respond_to do |format|
#			format.html { redirect_to posts_url }
#			format.json { head :no_content }
#	end
	  @post = Post.find(params[:id])
	  @post.destroy
	 
	  redirect_to posts_path
	end

private
	def set_post
		@post = Post.find(params[:id])
	end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

