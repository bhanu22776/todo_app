module ApplicationHelper

	def select_developers
		@developers.collect{ |u| [u.name.titleize, u.id] }
	end

	def select_status
		[['Open', 'open'], ['In Progress', 'in_progress'], ['Done', 'done']]
	end
end
