class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
      t.string :url
      t.string :username
      t.string :slug
    	t.text :description
    	t.timestamps
    	t.belongs_to :user, foreign_key: :user_id
    end
  end
end
