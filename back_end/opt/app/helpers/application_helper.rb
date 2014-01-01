module ApplicationHelper

	def sty
	["/assets/stylesheets/bootstrap.css",
	"/assets/stylesheets/bootstrap-responsive.css",
	"/assets/stylesheets/sb-admin.css",
	"/assets/stylesheets/heroic-features.css",
	"/assets/stylesheets/jquery.terminal.css",
	"/assets/stylesheets/jquery-ui.css"]
	end

	def render_styles
		sty.each do |style|
			"stylesheet_link_tag '#{style}', media: 'all', 'data-turbolinks-track' => true"
		end
	end

end
