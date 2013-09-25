class CreatePostcategory < ActiveRecord::Migration
  def change
    create_table :postcategories do |t|
    	t.belongs_to :post
      t.belongs_to :category
      t.timestamps
    end
  end
end
