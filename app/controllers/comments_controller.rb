class CommentsController < ApplicationController
	  def index
  	@comments = Comment.all
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  def new
  	@comments = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)

 	respond_to do |format|
		if @comment.save
  		format.html { redirect_to @comment, notice: 'Comment was successfully created.'}
  		format.json { render action: 'show', status: :created, location: @comment }
  	else
  		format.html { redner action: 'new'}
			format.json { render json: @comment.errors, status: :unprocessable_entity }
		end
  end
  	
 	def edit
	  @comment = Comment.find(params[:id])
	end

	def update
		respond_to do |format|
			if @comment.update(post_params)
				format.htms { redirect_to @comment, notice: 'Comment was successfully updated.'}
				format json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @comment_errors, status: :unprocessable_entity }
			end

	  @comment = Comment.find(params[:id])
	 
	  if @comment.update(params[:comment].permit(:title, :text))
	    redirect_to @comment
	  else
	    render 'edit'
	  end
	end

	def destroy
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to posts_url }
			format.json { head :no_content }
	end


private
	def set_comment
		@comment = Comment.find(params[:id])
	end

  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end

