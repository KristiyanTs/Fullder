module MenusHelper
	def delete_menu_text(name)
		"Proceed deleting " + name + " menu?"
	end

	def output_menu_status(active)
		if active
			content_tag(:button, "Active", class: ["strong", "highlight", "btn", "btn-success"])
		end
	end

	def is_active(menu)
		if menu.active
			true
		else
			false
		end
	end
end
