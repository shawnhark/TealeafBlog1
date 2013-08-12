class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.integer :user_id, :group_id
    	t.belongs_to :user_id, :group_id
    end
  end
end
