class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name, :slug
    	t.belongs_to :post, :comment
    end
  end
end
