class Category < ActiveRecord::Base
	has_many :posts
	has many :comments
end