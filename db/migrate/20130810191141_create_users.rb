class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, :role, :time_zone
    	t.string :password_digest, :slug
    end
  end
end
