 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0a3325',
    base01 = '#10563d',
    base02 = '#0f4d37',
    base03 = '#647a72',
    base04 = '#afb6b4',
    base05 = '#f2f3f2',
    base06 = '#f2f3f2',
    base07 = '#f2f3f2',
    base08 = '#fd4663',
    base09 = '#74cc66',
    base0A = '#54c9de',
    base0B = '#67e4b8',
    base0C = '#a1e996',
    base0D = '#93eccc',
    base0E = '#94ddea',
    base0F = '#910017',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f3f2',          bg = '#0a3325' })
  hi('TelescopeBorder',         { fg = '#647a72',             bg = '#0a3325' })
  hi('TelescopePromptNormal',   { fg = '#f2f3f2',          bg = '#0a3325' })
  hi('TelescopePromptBorder',   { fg = '#647a72',             bg = '#0a3325' })
  hi('TelescopePromptPrefix',   { fg = '#67e4b8',             bg = '#0a3325' })
  hi('TelescopePromptCounter',  { fg = '#afb6b4',  bg = '#0a3325' })
  hi('TelescopePromptTitle',    { fg = '#0a3325',             bg = '#67e4b8' })
  hi('TelescopePreviewTitle',   { fg = '#0a3325',             bg = '#54c9de' })
  hi('TelescopeResultsTitle',   { fg = '#0a3325',             bg = '#74cc66' })
  hi('TelescopeSelection',      { fg = '#f2f3f2',          bg = '#0f4d37' })
  hi('TelescopeSelectionCaret', { fg = '#67e4b8',             bg = '#0f4d37' })
  hi('TelescopeMatching',       { fg = '#67e4b8',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
