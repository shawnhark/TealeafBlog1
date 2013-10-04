class User < ActiveRecord::Base
	has_many :comments, foreign_key: :user_id
	has_many :posts, dependent: :destroy
	has_many :votes

	has_secure_password validations: false

	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, on: :create, length: { minimum: 3 }

  after_validation :generate_slug

  def admin?
    self.role == "admin"
    else self.role = "user"
  end


  def generate_slug
    self.slug = self.username.gsub(/[^0-9a-zA-Z]/, "_").downcase
  end

  def to_param
    self.slug
  end

end