class CommentsController < ApplicationController
	before_action :require_user

  def create
  	@post = Post.find_by(slug: params[:post_id])
	  @comment = Comment.new(params.require(:comment).permit(:body))
	  @comment.post = @post
	  @comment.creator = current_user

			if @comment.save
				flash[:notice] = "You created a new comment."
				redirect_to post_path(@post)
	  	else
				render 'posts/show'
	  	end
  end

  def vote
    Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        flash[:notice] = "Your vote was counted."
        redirect_to :back
      end

      format.js

    end

  private
  def post_params
    params.require(:post).permit(:title, :url)
  end
  
end
