class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name
    	t.belongs_to :post, :comment
    end
  end
end
