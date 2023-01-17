require("filetype").setup({
	overrides = {
		extensions = {
			-- Set the filetype of *.pn files to potion
			re = "reason",
			rei = "reason",
			res = "rescript",
			resi = "rescript",
			mjs = "javascript",
		},
		shebang = {
			node = "javascript",
		},
	},
})
