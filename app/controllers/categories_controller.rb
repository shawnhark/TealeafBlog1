class CategoriesController < ActionController
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params.require(:category).permit(:name))
		if @category.save
			flash[:notice] = "New category created."
			redirect_to_root_path
		else
			render :new
		end
	end
end