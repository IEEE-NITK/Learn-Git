module ApplicationHelper

	def sty
	["/assets/bootstrap.css",
	"/assets/bootstrap-responsive.css",
	"/assets/sb-admin.css",
	"/assets/heroic-features.css",
	"/assets/jquery.terminal.css",
	"/assets/jquery-ui.css"]
	end

	def render_styles
		sty.each do |style|
			"stylesheet_link_tag '#{style}', media: 'all', 'data-turbolinks-track' => true"
		end
	end

end
