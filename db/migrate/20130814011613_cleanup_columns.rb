class CleanupColumns < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.remove :user_id
  		t.belongs_to :user
  	end
  end
end
