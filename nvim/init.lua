vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
require("config.keymaps")
require("config.options")
vim.cmd.colorscheme("rey_ts")

vim.api.nvim_create_augroup("NetrwRelNum", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "NetrwRelNum",
  pattern = "netrw",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})

