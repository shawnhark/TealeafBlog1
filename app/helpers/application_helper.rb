module ApplicationHelper

	def fix_url(url)
		url.starts_with?('http') ? url :  "http://#{url}"
	end

	def display_datetime(dt)
		  dt = dt.in_time_zone(current_user.time_zone) if logged_in?
      dt.strftime("%A, %b %d, %Y at %I:%M%P %Z")
	end

  def generate_slug
    self.slug = self.name.gsub(/[^0-9a-zA-Z]/, "_").downcase
  end
end
