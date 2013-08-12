class CreatePosts < ActiveRecord::Migration
  def change

    create_table :posts do |t|
    	t.string :title, :url
    	t.text :description
    	t.timestamps
    	t.belongs_to :user_id
    end
  end
end
