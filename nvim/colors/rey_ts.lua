-- ~/.config/nvim/colors/rey_ts.lua
-- Neovim colorscheme basado en tu paleta. Fondo completamente negro.
-- Tree-sitter usa captures estándar tipo @keyword, @function, etc. :contentReference[oaicite:1]{index=1}

local hl = function(group, spec)
  vim.api.nvim_set_hl(0, group, spec) -- reemplaza la definición completa :contentReference[oaicite:2]{index=2}
end

local c = {
  bg = "#000000",
  fg = "#d7d7d7",
  fg_dim = "#9aa5b1",

  h1 = "#9b82ff",
  h2 = "#39e639",
  h3 = "#eb3f3f",
  h4 = "#eb8d3b",
  h5 = "#38ebb4",
  h6 = "#9aa5b1",

  bold = "#3b99eb",   -- asumido (azul celeste)
  italic = "#e639e6", -- asumido (morado)
}

-- Complementarios (calculados en HSL, hue+180°) para que sean “complementarios” de rueda de color
local comp = {
  h1 = "#e6ff82",
  h2 = "#e639e6",
  h3 = "#3febeb",
  h4 = "#3b99eb",
  h5 = "#eb386f",
  h6 = "#b1a69a",
}

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g.colors_name = "rey_ts"

-- UI mínimo (fondo negro real)
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
hl("NonText", { fg = "#2a2a2a", bg = c.bg })
hl("Whitespace", { fg = "#2a2a2a", bg = c.bg })

hl("CursorLine", { bg = "#0a0a0a" })
hl("LineNr", { fg = "#3a3a3a" })
hl("CursorLineNr", { fg = c.h2, bold = true })
hl("Visual", { bg = "#151515" })

hl("Comment", { fg = c.h6, italic = true })
hl("String", { fg = c.h5 })
hl("Number", { fg = c.h4 })
hl("Boolean", { fg = c.h4 })
hl("Function", { fg = c.h1 })
hl("Identifier", { fg = c.fg })
hl("Type", { fg = c.h1 })
hl("Constant", { fg = c.h3 })
hl("Keyword", { fg = c.h2, bold = true })
hl("Operator", { fg = c.h4 })

hl("DiagnosticError", { fg = c.h3 })
hl("DiagnosticWarn", { fg = c.h4 })
hl("DiagnosticInfo", { fg = c.h5 })
hl("DiagnosticHint", { fg = c.h1 })

-- Tree-sitter captures estándar (Neovim docs) :contentReference[oaicite:3]{index=3}
hl("@comment", { link = "Comment" })
hl("@comment.documentation", { fg = c.h6, italic = true })

hl("@string", { fg = c.h5 })
hl("@string.escape", { fg = c.h4 })
hl("@string.special", { fg = c.h4 })

hl("@character", { fg = c.h5 })
hl("@number", { fg = c.h4 })
hl("@number.float", { fg = c.h4 })
hl("@boolean", { fg = c.h4 })

hl("@constant", { fg = c.h3 })
hl("@constant.builtin", { fg = c.h3, bold = true })
hl("@constant.macro", { fg = c.h3 })

hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.fg_dim, italic = true })
hl("@parameter", { fg = c.fg, italic = true })
hl("@field", { fg = c.h5 })
hl("@property", { fg = c.h5 })

hl("@function", { fg = c.h1 })
hl("@function.builtin", { fg = c.h1, bold = true })
hl("@function.call", { fg = c.h1 })
hl("@function.macro", { fg = c.h2 })

hl("@function.method", { fg = c.h1 })
hl("@function.method.call", { fg = c.h1 })

hl("@constructor", { fg = c.h1 })

hl("@type", { fg = c.h1 })
hl("@type.builtin", { fg = c.h1, italic = true })
hl("@type.definition", { fg = c.h1 })

hl("@keyword", { fg = c.h2, bold = true })
hl("@keyword.function", { fg = c.h2, bold = true })
hl("@keyword.return", { fg = c.h2, bold = true })
hl("@keyword.operator", { fg = c.h2 })
hl("@keyword.import", { fg = c.h2 })
hl("@keyword.conditional", { fg = c.h2 })
hl("@keyword.repeat", { fg = c.h2 })
hl("@keyword.exception", { fg = c.h2 })

hl("@operator", { fg = c.h4 })
hl("@punctuation.delimiter", { fg = c.fg_dim })
hl("@punctuation.bracket", { fg = c.fg_dim })
hl("@punctuation.special", { fg = c.fg_dim })

-- Markup (Markdown, docs, etc.) :contentReference[oaicite:4]{index=4}
hl("@markup.strong", { fg = c.bold, bold = true })
hl("@markup.italic", { fg = c.italic, italic = true })
hl("@markup.strikethrough", { fg = c.fg_dim, strikethrough = true })
hl("@markup.underline", { underline = true })

hl("@markup.raw", { fg = c.h5, bg = "#050505" })
hl("@markup.raw.block", { fg = c.h5, bg = "#050505" })

hl("@markup.heading.1", { fg = c.h1, bold = true })
hl("@markup.heading.2", { fg = c.h2, bold = true })
hl("@markup.heading.3", { fg = c.h3, bold = true })
hl("@markup.heading.4", { fg = c.h4, bold = true })
hl("@markup.heading.5", { fg = c.h5, bold = true })
hl("@markup.heading.6", { fg = c.h6, bold = true })

hl("@markup.link.url", { fg = c.h4, underline = true })
hl("@markup.link.label", { fg = c.h2 })
hl("@markup.list", { fg = c.h2 })
hl("@markup.quote", { fg = c.h3, italic = true })

hl("@tag", { fg = c.h2 })
hl("@tag.attribute", { fg = c.h4 })
hl("@tag.delimiter", { fg = c.fg_dim })

hl("@diff.plus", { fg = c.h2 })
hl("@diff.minus", { fg = c.h3 })
hl("@diff.delta", { fg = c.h4 })

-- Compat: nombres viejos que aún aparecen en algunos setups
hl("@text.strong", { link = "@markup.strong" })
hl("@text.emphasis", { link = "@markup.italic" })
hl("@text.uri", { link = "@markup.link.url" })
hl("TSKeyword", { link = "@keyword" })
hl("TSFunction", { link = "@function" })
hl("TSString", { link = "@string" })
hl("TSComment", { link = "@comment" })

-- Opcional: LSP semantic tokens hacia TS (si tu config los usa)
hl("@lsp.type.function", { link = "@function" })
hl("@lsp.type.method", { link = "@function.method" })
hl("@lsp.type.keyword", { link = "@keyword" })
hl("@lsp.type.type", { link = "@type" })
hl("@lsp.type.variable", { link = "@variable" })
hl("@lsp.type.property", { link = "@property" })
