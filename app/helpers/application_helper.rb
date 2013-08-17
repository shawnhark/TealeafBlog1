module ApplicationHelper
	def fix_url(url)
		url.starts_with?('http') ? url :  "http://#{url}"
	end

	def display_datetime(dt)
		dt.strftime("%b %d, %Y at %1:%M%P %Z")
		#Aug 10, 2013 at 1:23pm UTC
	end
end
