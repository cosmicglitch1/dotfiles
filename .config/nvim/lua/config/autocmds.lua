-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
--   end,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.mouse = "a"
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"init.lua", "lua/**/*.lua"},
  callback = function()
    -- Clear loaded Lua modules in 'config' namespace
    for name,_ in pairs(package.loaded) do
      if name:match("^config") then
        package.loaded[name] = nil
      end
    end
    require("config")
    vim.opt.mouse = "a"
    print("Reloaded config and ensured mouse is enabled!")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
