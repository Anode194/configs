vim.api.nvim_create_automd({"User"}, {
	pattern = "GoyoEnter",
	command = ":Limelight<cr>",
})
