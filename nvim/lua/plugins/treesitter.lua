-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,              -- nvim-treesitter no soporta lazy-loading
    build = ":TSUpdate",       -- mantiene parsers al día al actualizar el plugin
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Instala/asegura parsers (no-op si ya existen)
      require("nvim-treesitter").install({
        "lua", "vim", "vimdoc", "bash", "markdown", "json",
        "ini",
      }):wait(300000)

      -- En la rama nueva, el highlighting lo enciende Neovim (no el plugin)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "vim", "bash", "markdown", "json", "dosini" },
        callback = function() vim.treesitter.start() end,
      })

      -- .ini normalmente cae como filetype=dosini; lo mapeas al parser "ini"
      vim.treesitter.language.register("ini", { "dosini" })

      -- Si tienes .conf genéricos que realmente son INI-like:
      -- vim.treesitter.language.register("ini", { "conf" })
    end,
  },
}
