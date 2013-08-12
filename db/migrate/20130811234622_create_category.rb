class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.text :name
    	t.belongs_to :post_id, :comment_id
    end
  end
end
