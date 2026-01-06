vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files"  })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git Files"  })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explorer" }) 
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "S", ":w<CR>", { noremap = true, silent = true})
