class User < ActiveRecord::Base
	has_many :comments, foreign_key: :user_id
	has_many :posts, dependent: :destroy
	has_many :votes

	has_secure_password validations: false

	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, on: :create, length: { minimum: 3 }
end