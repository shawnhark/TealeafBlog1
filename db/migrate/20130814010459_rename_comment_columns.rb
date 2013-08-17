class RenameCommentColumns < ActiveRecord::Migration
  def change
  	change_table :memberships do |t|
  		t.remove :user_id_id, :group_id_id
  	end
  end
end
