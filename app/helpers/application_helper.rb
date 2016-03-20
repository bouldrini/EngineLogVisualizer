module ApplicationHelper
	def icon(name)
		html = "<i class='fa fa-#{name}'></i>"
		return html
	end
end
