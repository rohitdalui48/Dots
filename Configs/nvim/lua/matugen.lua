 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#11131c',
    base01 = '#1d1f29',
    base02 = '#272934',
    base03 = '#8c90a6',
    base04 = '#c2c5dd',
    base05 = '#e1e1ef',
    base06 = '#e1e1ef',
    base07 = '#e1e1ef',
    base08 = '#ffb4ab',
    base09 = '#b6c4ff',
    base0A = '#88d0ec',
    base0B = '#5ed4fc',
    base0C = '#b6c4ff',
    base0D = '#5ed4fc',
    base0E = '#88d0ec',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e1e1ef',          bg = '#11131c' })
  hi('TelescopeBorder',         { fg = '#8c90a6',             bg = '#11131c' })
  hi('TelescopePromptNormal',   { fg = '#e1e1ef',          bg = '#11131c' })
  hi('TelescopePromptBorder',   { fg = '#8c90a6',             bg = '#11131c' })
  hi('TelescopePromptPrefix',   { fg = '#5ed4fc',             bg = '#11131c' })
  hi('TelescopePromptCounter',  { fg = '#c2c5dd',  bg = '#11131c' })
  hi('TelescopePromptTitle',    { fg = '#11131c',             bg = '#5ed4fc' })
  hi('TelescopePreviewTitle',   { fg = '#11131c',             bg = '#88d0ec' })
  hi('TelescopeResultsTitle',   { fg = '#11131c',             bg = '#b6c4ff' })
  hi('TelescopeSelection',      { fg = '#e1e1ef',          bg = '#272934' })
  hi('TelescopeSelectionCaret', { fg = '#5ed4fc',             bg = '#272934' })
  hi('TelescopeMatching',       { fg = '#5ed4fc',             bold = true })
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
