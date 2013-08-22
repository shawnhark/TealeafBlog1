class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :creator

	validates :body, :presence => true
	#more in line above
end