vim.api.nvim_create_automd({"User"}, {
	pattern = "GoyoEnter",
	command = ":Limelight<cr>",
})
vim.api.nvim_create_automd({"User"}, {
	pattern = "GoyoEnter",
	command = ":set linebreak<cr>",
})
