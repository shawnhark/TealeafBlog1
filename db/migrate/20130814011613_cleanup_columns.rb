class CleanupColumns < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.remove :user_id
  		t.belongs_to :user
  	end
  	change_table :comments do |t|
  		t.remove :user_id_id, :post_id_id
  		t.belongs_to :user, :posts
  	end
  end
end
