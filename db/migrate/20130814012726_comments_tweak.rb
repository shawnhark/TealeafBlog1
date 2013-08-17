class CommentsTweak < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
  		t.remove :posts_id
  		t.belongs_to :post
  	end
  end
end
