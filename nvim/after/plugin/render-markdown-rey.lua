local bg = {
  "#d7fed9", -- H1  (quitando alpha "ff")
  "#37003e", -- H2
  "#432a00", -- H3
  "#00314a", -- H4
  "#1b2243", -- H5
  "#000000", -- H6
}

local fg = {
  "#9d00ff", -- rgba(157,0,255,1) -> #9d00ff
  "#04ff00", -- quitando alpha "ff"
  "#38ebeb", -- ya estaba OK
  "#ed5720", -- quitando alpha "ff"
  "#ff0000", -- quitando alpha "ff"
  "#bababa", -- quitando alpha "ff"
}

local function apply_render_markdown_headings()
  for i = 1, 6 do
    -- IMPORTANTE: Bg también necesita fg (porque nvim_set_hl reemplaza todo el grupo).
    vim.api.nvim_set_hl(0, ("RenderMarkdownH%dBg"):format(i), { bg = bg[i], fg = fg[i], bold = true })
    vim.api.nvim_set_hl(0, ("RenderMarkdownH%d"):format(i),   { bg = bg[i], fg = fg[i], bold = true })
  end
end

apply_render_markdown_headings()

-- Re-aplicar si cambias de colorscheme durante la sesión
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.schedule(apply_render_markdown_headings)
  end,
})
