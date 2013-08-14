class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.belongs_to :user, :group
    end
  end
end
