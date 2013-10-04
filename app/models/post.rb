class Post < ActiveRecord::Base
  include Simplevote

	belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories

	validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  after_validation :generate_slug
	
  def generate_slug
    self.slug = self.title.gsub(/[^0-9a-zA-Z]/, "_").downcase
  end

  def to_param
    self.slug
  end
end