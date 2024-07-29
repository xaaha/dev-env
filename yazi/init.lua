-- hide the status bar
function Status:render()
	return {}
end

local old_manager_render = Manager.render
function Manager:render(area)
	return old_manager_render(self, ui.Rect({ x = area.x, y = area.y, w = area.w, h = area.h + 1 }))
end
--
