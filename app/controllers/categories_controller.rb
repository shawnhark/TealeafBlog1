class CategoriesController < ApplicationController
	before_action :set_category
	before_action :require_admin, only: [:new, :create, :edit, :update]


  def index
  	@categories = Category.all
  end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params.require(:category).permit(:name))
		if @category.save
			flash[:notice] = "New category created."
			redirect_to root_path
		else
			render :new
		end
	end

	def show
    @category = Category.find_by slug: params[:id]
		@posts = @category.posts
		@title = @category.name

    respond_to do |format|
      format.html { @category = Category.new }
      format.json {render json: @category}
    end
	end

	def update
	end

 	def edit
  end

  private
	def set_category
		@category = Category.find_by slug: params[:id]
	end

  def category_params
    params.require(:category).permit!
  end

end