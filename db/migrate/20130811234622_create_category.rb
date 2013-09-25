class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name
      t.string :slug
    	t.belongs_to :post
      t.belongs_to :comment
      t.timestamps
    end
  end
end
