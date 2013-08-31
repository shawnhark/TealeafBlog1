class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, through: :post_categories

	validates :name, presence: true

  after_validation :generate_slug

  def generate_slug
    self.slug = self.title.gsub(/[^0-9a-z]/, "_").downcase
  end

  def to_param
    self.slug
  end


end