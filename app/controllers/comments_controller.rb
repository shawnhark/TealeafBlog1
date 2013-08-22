class CommentsController < ApplicationController
	before_action :require_user

  def create
  	@post = Post.find(params[:post_id])
	  @comment = Comment.new(params.require(:comment).permit(:body))
	  @comment.post = @post
	  @comment.user = current_user

			if @comment.save
				flash[:notice] = "You created a new comment."
				redirect_to post_path(@post)
	  	else
				render 'posts/show'
	  	end
  end
  	
# 	def edit
#	  @comment = Comment.find(params[:id])
#	end

#	def update
#		respond_to do |format|
#				format.htms { redirect_to @comment, notice: 'Comment was successfully updated.'}
#				format json { head :no_content }
#			else
#				format.html { render action: 'edit' }
#				format.json { render json: @comment_errors, status: :unprocessable_entity }
#			end

#	  @comment = Comment.find(params[:id])
	 
#	  if @comment.update(params[:comment].permit(:title, :text))
#	    redirect_to @comment
#	  else
#	    render 'edit'
#	  end
#	end

#	def destroy
#		@comment.destroy
#		respond_to do |format|
#			format.html { redirect_to posts_url }
#			format.json { head :no_content }
#	end


#private
#	def set_comment
#		@comment = Comment.find(params[:id])
#	end

#  def comment_params
#    params.require(:comment).permit(:title, :text)
#  end
end

