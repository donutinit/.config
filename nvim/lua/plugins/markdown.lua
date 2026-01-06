return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" }, -- carga solo en markdown
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- opcional para íconos bonitos arriba de codeblocks:
      -- "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("render-markdown").setup({
        -- defaults ya ajustan conceallevel/ concealcursor al renderizar
        -- (útil para “concealing” sin que tú lo sets manualmente)
        render_modes = { 'n', 'i', 'c', 't','v', '\22' }
      })
    end,
  },
}
