class PostCategoriesController < ApplicationController

def new
end

def create
  @post = Post.find_by(slug: params[:post_id])
  @category = Category.find_by(slug: params[:category_id])
  @post_category.create
end

private
  def post_categories_params
    params.permit!
  end