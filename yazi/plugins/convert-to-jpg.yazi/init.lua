return {
	entry = function(self, args)
		local file_path = args[1]

		if file_path then
			-- Construct the ffmpeg command
			local command = string.format('ffmpeg -i "%s" "%s.jpg"', file_path, file_path)

			-- Execute the command
			os.execute(command)
			ya.info("Converted " .. file_path .. " to " .. file_path .. ".jpg")
		else
			ya.err("No file selected")
		end
	end,
}
