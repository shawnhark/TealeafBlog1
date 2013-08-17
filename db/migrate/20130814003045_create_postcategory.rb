class CreatePostcategory < ActiveRecord::Migration
  def change
    create_table :postcategories do |t|
    	t.belongs_to :post, :category
    end
  end
end
